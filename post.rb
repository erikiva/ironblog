class Post
  attr_accessor :title, :date, :text, :sponsored

  def initialize title, date, text, sponsored = false
    @title = title
    @date = date
    @text = text
    @sponsored = sponsored
  end
end
