require './test/test_helper'

class PageEditTest < FeatureTest
  def test_it_edits_a_page
    page_data = {:slug => "edit_test",
                   :content => "unedited content"}
    edited_text = "now it is edited"
    Page.create( page_data )
    visit "/pages/edit_test"
    click_link_or_button "Edit"
    fill_in "content", with: edited_text
    click_link_or_button "Submit"
    assert page.has_content? edited_text
    refute page.has_content? page_data[:content]
  end
end
