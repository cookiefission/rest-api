Then(/^the response status is (\d+)$/) do |status_code|
  expect(last_response.status).to eql(status_code)
end
