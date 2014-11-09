require './test/test_helper'

class PageDeleteTest < FeatureTest
  def test_it_deletes_a_page
    page_data_1 = {:slug => "delete_test1",
                   :content => "aaa"}
    page_data_2 = {:slug => "delete_test2",
                   :content => "bbb"}

    Page.create( page_data_1 )
    Page.create( page_data_2 )

    Page.delete("delete_test1")
    visit "/pages/delete_test1"
    refute_equal 200, page.status_code

    visit "/pages/delete_test2"
    assert_equal 200, page.status_code
  end
end
