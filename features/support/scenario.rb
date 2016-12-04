module Scenario

  VALID_USER = "tomsmith"
  VALID_PASS = "SuperSecretPassword!"

  def login_user(email, pass)
    on Heroku::LoginPage do |page|
      page.set_email_field(email)
      page.set_password_field(pass)
      page.submit_login_form
    end
  end
end

World Scenario