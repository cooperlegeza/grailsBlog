require 'page-object'
require 'watir-webdriver'

class BlogHome
  include PageObject
  page_url 'http://localhost:8080'

  links(:blog_post_links, :class => 'blog-post-title')
  spans(:date_created_spans, :class => 'date-created')
  input(:login_button, :class => 'login-button')


end
