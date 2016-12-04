class Heroku::HoverPage < Heroku::BasePage
  page_url "#{Heroku::BASE_URL}/hovers"

  element(:content_wrapper) { |b| b.div(id: "content") }

  def hover_over_image(image_count)
    index = image_count.to_i - 1
    content_wrapper.imgs(alt: "User Avatar")[index].hover
  end
end