require 'test_helper'

class NotebooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notebook = notebooks(:notebook_one)
  end

  test "should get index" do
    get notebooks_url
    assert_response :success
  end

  test "should get new" do
    get new_notebook_url
    assert_response :success
  end

  test "should create notebook" do
    assert_difference('Notebook.count') do
      post notebooks_url, params: { notebook: { title: @notebook.title } }
    end

    assert_redirected_to notebook_url(Notebook.last)
  end

  test "should show notebook" do
    get notebook_url(@notebook)
    assert_response :success
  end

  test "should get edit" do
    get edit_notebook_url(@notebook)
    assert_response :success
  end

  test "should update notebook" do
    patch notebook_url(@notebook), params: { notebook: { title: @notebook.title } }
    assert_redirected_to notebook_url(@notebook)
  end

  test "should destroy notebook" do
    assert_difference('Notebook.count', -1) do
      delete notebook_url(@notebook)
    end

    assert_redirected_to notebooks_url
  end

  test "should list two notebooks on /notebooks" do
    get notebooks_url
    assert_select ".notebooks" do |i|
      assert_select i, ".notebook", 2
    end
  end

  test "should show notebook name in title" do
    get notebook_url(@notebook)
    assert_select "title", "Awesome Notebook App:\nMy First Notebook"
  end

end
