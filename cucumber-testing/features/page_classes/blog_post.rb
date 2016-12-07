require 'page-object'
require 'watir-webdriver'

class BlogPost
  include PageObject

  span(:title, :id => 'title')
  span(:author, :id => 'author')
  div(:text, :id => 'text')
  span(:date, :id => 'date-created')

  def date_created
    DateTime.parse(date_element.attribute('title'))
  end
end