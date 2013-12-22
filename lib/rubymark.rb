class RubyMark
  def initialize(markdown)
    @markdown = @html = markdown
  end
  
  def toh
    self
      .ordered_lists
      .unordered_lists
      .emphasis
      .headings
      .blockquotes
      .paragraphs
      .links
  end
  
  def ordered_lists
    @html = @html
      .gsub(/\n\n(\d*\. .*)/, "\n<ol>\n\\1")
      .gsub(/^(\d*\. .*)\n\n/, "\\1\n</ol>\n")
      .gsub(/^\d*\. (.*)/, "<li>\\1</li>")
    
    self
  end

  def unordered_lists
    @html = @html
      .gsub(/\n\n(\* .*)/, "<ul>\n\\1")
      .gsub(/^(\* .*)\n\n/, "\\1\n</ul>\n\n")
      .gsub(/^\* (.*)/, "<li>\\1</li>")
    
    self
  end

  def emphasis
    @html = @html
      .gsub(/__(.*)__/, "<strong>\\1</strong>")
      .gsub(/_(.*)_/, "<em>\\1</em>")
      .gsub(/ <em> /, " _ ")
      .gsub(/ <\/em> /, " _ ")
      .gsub(/\\<em>/, "_")
      .gsub(/\\<\/em>/, "_")
      .gsub(/\*\*(.*)\*\*/, "<strong>\\1</strong>")
      .gsub(/\*(.*)\*/, "<em>\\1</em>")
      .gsub(/ <em> /, " * ")
      .gsub(/ <\/em> /, " * ")
      .gsub(/\\<em>/, "*")
      .gsub(/\\<\/em>/, "*")
    self
  end
  
  def headings
     @html = @html
        .gsub(/^\#\#\#\#\#\# (.*) \#\#\#\#\#\#/, '<h6>\1</h6>')
        .gsub(/^\#\#\#\#\#\# (.*)/, '<h6>\1</h6>')
        .gsub(/^\#\#\#\#\# (.*) \#\#\#\#\#/, '<h5>\1</h5>')
        .gsub(/^\#\#\#\#\# (.*)/, '<h5>\1</h5>')
        .gsub(/^\#\#\#\# (.*) \#\#\#\#/, '<h4>\1</h4>')
        .gsub(/^\#\#\#\# (.*)/, '<h4>\1</h4>')
        .gsub(/^\#\#\# (.*) \#\#\#/, '<h3>\1</h3>')
        .gsub(/^\#\#\# (.*)/, '<h3>\1</h3>')
        .gsub(/^\#\# (.*) \#\#/, '<h2>\1</h2>')
        .gsub(/^\#\# (.*)/, '<h2>\1</h2>')
        .gsub(/^\# (.*) \#/, '<h1>\1</h1>')
        .gsub(/^\# (.*)/, '<h1>\1</h1>')

      self
  end
  
  def paragraphs
    @html = @html
      .gsub(/^\n(.+)\n$/, "\n<p>\\1</p>\n")
      .gsub(/\A(.+)/, "<p>\\1")
      .gsub(/(.+)\Z/, "\\1</p>")
      .gsub(/\n\n/, "</p>\n\n<p>")
      .gsub(/\n\n<p><\/p>\n\n/, "\n\n")
      .gsub(/\A<\/p>/, "")
      .gsub(/<p>\Z/, "")
      .gsub(/<p>(<.*>)/, "\\1")
      .gsub(/(<.*>)<\/p>/, "\\1")
      .gsub(/<p>(<.*>)/, "\\1")
      .gsub(/(<.*>)<\/p>/, "\\1")
    
    self
  end
  
  def links
    @html = @html
      .gsub(/\[(.*)\]\((.*) "(.*)"\)/, "<a href=\"\\2\" title=\"\\3\">\\1</a>")
      .gsub(/\[(.*)\]\((.*)\)/, "<a href=\"\\2\">\\1</a>")
    
    self
  end
  
  def blockquotes
    @html = @html
      .gsub(/\n> (.*)\n[^>]/m, "\n<blockquote>\\1</blockquote>\n\n")
      .gsub(/\n> /, "\n")
      # .gsub(/^\n> (.*)\n$/, "\n<blockquote>\\1</blockquote>\n")
      #.gsub(/<p>> (.*)<\/p>/, "<blockquote>\\1</blockquote>")
      #.gsub(/<p>> (.*)<\/p>/m, "<blockquote>\\1</blockquote>")
    
    self
  end
  
  def to_html
    self
      .ordered_lists
      .unordered_lists
      .emphasis
      .headings
      .blockquotes
      .paragraphs
      .links
    
    @html
  end
end

class RubyMarkRunner
  def run args
    unless args[0]
      print_usage 
    else
      process_md_file(ARGV[0])
    end
  end
  
  def print_usage
    puts "Usage: rubymark file.md  # this will send html to STDOUT"
  end

  def process_md_file(md_file_name)
    markdown = File.read(md_file_name)
    puts RubyMark.new(markdown).to_html
  end
end