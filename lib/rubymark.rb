class RubyMark
  def initialize(markdown)
    @markdown = markdown
  end
  
  def to_html
    @markdown
      .gsub(/\n\n(\d*\. .*)/, "<ol>\n\\1")
      .gsub(/^\d*\. (.*)\n\n/, "\\1\n</ol>")
      .gsub(/^\d*\. (.*)/, "<li>\\1</li>")
      .gsub(/\n\n(\* .*)/, "<ul>\n\\1")
      .gsub(/^\* (.*)\n\n/, "\\1\n</ul>")
      .gsub(/^\* (.*)/, "<li>\\1</li>")
      .gsub(/^\#\#\#\#\#\# (.*)/, '<h6>\1</h6>')
      .gsub(/^\#\#\#\#\# (.*)/, '<h5>\1</h5>')
      .gsub(/^\#\#\#\# (.*)/, '<h4>\1</h4>')
      .gsub(/^\#\#\# (.*)/, '<h3>\1</h3>')
      .gsub(/^\#\# (.*)/, '<h2>\1</h2>')
      .gsub(/^\# (.*)/, '<h1>\1</h1>')
  end
end