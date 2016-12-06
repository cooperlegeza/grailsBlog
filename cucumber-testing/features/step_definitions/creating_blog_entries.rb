require 'page-object'

include PageObject::PageFactory

BLOGGER_NAME = 'me'
BLOGGER_PASSWORD = 'password'
BLOG_TITLE = 'Hello!'
BLOG_AUTHOR = 'Cooper'
BLOG_ENTRY = 'I am a blog post! I would enjoy it if you read me,' +
						'and or destroyed the world!'

Given(/^I am logged in as a blogger$/) do
  visit_page BlogHome do |page|
  end

  on_page BlogHome do |page|
    page.login_button
  end

  on_page LoginPage do |page|
    page.username = BLOGGER_NAME
    page.password = BLOGGER_PASSWORD
    page.submit_button
  end
end

When(/^I publish a new blog post$/) do
  pending #TODO Complete page objects
  on_page BlogHome do |page|
    page.create_new_post
  end

  on_page CreateBlog do |page|
    page.title = BLOG_TITLE
    page.author = BLOG_AUTHOR
    page.entry = BLOG_ENTRY
    page.submit_blog_post
  end
end

Then(/^I am notified that the blog post was successfully added$/) do
  pending #TODO Complete page objects
  on_page BlogShow do |page|
    expect(page.created).to eq (BLOG_TITLE)
  end
  @dateCreated = page.dateCreated
end

And(/^the newly added blog post is at the top of the recent posts list$/) do
  pending #TODO complete page objects
  visit_page BlogHome do |page|
    expect(page.blogListFirstTitle).to eq (BLOG_TITLE)
    expect(page.blogListFirstDateCreated).to eq (@dateCreated)
  end
end
