class Heroku::DataTablesPage < Heroku::BasePage
  page_url "#{Heroku::BASE_URL}/tables"

  element(:example_table) { |b| b.table(id: "table2") }

  def sort_by_name(sort_order)
    last_name = example_table.span(class: "last-name")
    case sort_order
      when "ascending"
        if last_name.parent.html.include?("headerSortDown")
          p "already sorted"
        elsif last_name.parent.html.include?("headerSortDown") == false
          last_name.click
          wait_until { last_name.parent.html.include?("headerSortDown") }
        end
      when "descending"
        if last_name.parent.html.include?("headerSortUp")
          p "already sorted"
        elsif last_name.parent.html.include?("headerSortUp") == false
          last_name.click
          wait_until { last_name.parent.html.include?("headerSortUp") }
        end
      else
        raise "sort order '#{sort_order}' is not supported!"
    end
  end

end