class Heroku::LoginPage < Heroku::BasePage
  page_url "#{Heroku::BASE_URL}/login"

  element(:email_field) { |b| b.text_field(id: "username") }
  element(:password_field) { |b| b.text_field(id: "password") }
  element(:login_button) { |b| b.button(type: "submit") }

  def set_email_field(email)
    email_field.when_present.set(email)
  end

  def set_password_field(password)
    password_field.when_present.set(password)
  end

  def submit_login_form
    login_button.when_present.click
  end
end