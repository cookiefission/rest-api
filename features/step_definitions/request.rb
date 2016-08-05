When(/^I send a GET to "([^"]*)"$/) do |url|
  get(url)
end

When(/^I send a POST to "([^"]*)"$/) do |url|
  post(url)
end

When(/^I send a PUT to "([^"]*)"$/) do |url|
  put(url)
end

When(/^I send a DELETE to "([^"]*)"$/) do |url|
  delete(url)
end

When(/^I send a PATCH to "([^"]*)"$/) do |url|
  patch(url)
end
