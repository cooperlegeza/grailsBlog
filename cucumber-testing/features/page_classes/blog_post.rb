require 'page-object'
require 'watir-webdriver'

class BlogPost
  include PageObject

  span(:title, :id => 'title')
  span(:author, :id => 'author')
  div(:text, :id => 'text')
  span(:date, :id => 'date-created')
  text_field(:comment_author, :id => 'authorId')
  text_area(:comment_text, :id => 'commentId')
  span(:first_comment_author, :class => 'comment-author')
  div(:first_comment_text, :class=> 'comment-text')
  spans(:first_comment_date, :class => 'comment-date-created')

  def date_created
    DateTime.parse(date_element.attribute('title'))
  end

  def title_string
    title.text
  end

  def author_text
    author.text
  end

  def div_text
    text.text
  end

  def first_comment_date_created
    DateTime.parse(first_comment_date_elements[0].attribute('title')).strftime(DATETIME_PATTERN)
  end

  def create_comment
    @browser.send_keys :tab
    @browser.send_keys :enter
  end
end