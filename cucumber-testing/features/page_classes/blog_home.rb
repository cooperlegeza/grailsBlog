require 'page-object'
require 'watir-webdriver'

class BlogHome
  include PageObject
  page_url 'http://localhost:8080'

  links(:blog_post_links, :class => 'blog-post-title')
  spans(:date_created_spans, :class => 'date-created')
  link(:login, :class => 'login-button')
  link(:create_post, :class => 'create')


end
