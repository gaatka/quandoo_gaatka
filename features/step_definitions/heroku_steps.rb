# Login steps

Given(/^I visit the Login page$/) do
  visit Heroku::LoginPage
end

When(/^I submit "([^"]*)" credentials$/) do |credential_type|
  case credential_type
    when "valid"
      login_user(Scenario::VALID_USER, Scenario::VALID_PASS)
    when "invalid"
      login_user("invalid", "invalid")
    when "valid username, invalid password"
      login_user(Scenario::VALID_USER, "abcd")
    else
      raise "case credential type '#{credential_type}' is not supported!"
  end
end

Then(/^I should see the message "([^"]*)"$/) do |message|
  sleep 5
  expect(@browser.text.include?(message)).to be true
end

# Hover steps

Given(/^I visit the heroku hover page$/) do
  visit Heroku::HoverPage
end

When(/^I hover over picture number (\d+)$/) do |picture_count|
  on Heroku::HoverPage do |page|
    sleep 5
    page.hover_over_image(picture_count)
  end
end

Then(/^the user name "([^"]*)" should be displayed$/) do |user_name|
  expect(@browser.text.include?(user_name)).to be true
end

# Table Sorting steps

Given(/^I visit the heroku data tables page$/) do
  visit Heroku::DataTablesPage
end

When(/^I sort by last name in "([^"]*)" order$/) do |sort_order|
  on Heroku::DataTablesPage do |page|
    page.sort_by_name(sort_order)
  end
end

Then(/^the last names should be ordered alphabetically in "([^"]*)" order$/) do |sort_order|
  on Heroku::DataTablesPage do |page|
    first_displayed_name = page.example_table.tds(class: "last-name").first.text
    last_displayed_name = page.example_table.tds(class: "last-name").last.text
    case sort_order
      when "ascending"
        expect(first_displayed_name < last_displayed_name).to be true
      when "descending"
        expect(first_displayed_name < last_displayed_name).to be false
      else
        raise "sort order #{sort_order} is not supported!"
    end
  end
end