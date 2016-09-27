require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:note_one)
    @notebook = notebooks(:notebook_one)
  end

  test "should get index" do
    get notebook_notes_url(@notebook)
    assert_response :success
  end

  test "should get new" do
    get new_notebook_note_url(@notebook)
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notebook_notes_url(@notebook), params: { note: { body: @note.body, title: @note.title }, notebook_id: @note.notebook }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { body: @note.body, title: @note.title } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notebook_notes_url(@notebook)
  end
end
