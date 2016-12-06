require 'page-object'
require 'watir-webdriver'

class BlogPost
  include PageObject

  span(:title, :class => 'title')
  span(:author, :class => 'author')
  div(:text, :id => 'text')
  span(:date, :id => 'date-created')

  def date_created
    
  end
end