class RubyMark
  def initialize(markdown)
    @markdown = markdown
  end
  
  def ordered_lists(markdown)
    markdown
      .gsub(/\n\n(\d*\. .*)/, "\n<ol>\n\\1")
      .gsub(/^(\d*\. .*)\n\n/, "\\1\n</ol>\n")
      .gsub(/^\d*\. (.*)/, "<li>\\1</li>")
  end

  def unordered_lists(markdown)
    markdown
      .gsub(/\n\n(\* .*)/, "<ul>\n\\1")
      .gsub(/^(\* .*)\n\n/, "\\1\n</ul>\n\n")
      .gsub(/^\* (.*)/, "<li>\\1</li>")
  end

  def emphasis(markdown)
    markdown
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
  end
  
  def headings(markdown)
     markdown
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
  end
  
  def paragraphs(markdown)
    markdown
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
  end
  
  def links(markdown)
    markdown
      .gsub(/\[(.*)\]\((.*) "(.*)"\)/, "<a href=\"\\2\" title=\"\\3\">\\1</a>")
      .gsub(/\[(.*)\]\((.*)\)/, "<a href=\"\\2\">\\1</a>")
  end
  
  def blockquotes(markdown)
    markdown.gsub!(/((^[ \t]*>[ \t]?.+\n(.+\n)*\n*)+)/) do
  	  bq = $1
  	  if bq
        bq.gsub!(/^[ \t]*>[ \t]?/, "") # trim one level of quoting
		    bq.gsub!(/^[ \t]+$/, "")       # trim whitespace-only lines
		    bq.strip!
		  
		    "<blockquote><p>\n#{bq}\n</p></blockquote>\n\n"
		  else
		    $&
	    end
    end
    markdown
  end
  
  def to_html
    links(paragraphs(headings(emphasis(unordered_lists(ordered_lists(blockquotes(@markdown)))))))
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
    puts "Usage: rubymark file.md  # this will send HTML to STDOUT"
  end

  def process_md_file(md_file_name)
    markdown = File.read(md_file_name)
    puts RubyMark.new(markdown).to_html
  end
end