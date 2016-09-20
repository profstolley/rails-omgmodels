require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "notes must have a title" do
    note = Note.new(body: "I have no title")
    assert note.invalid?, "note should not be valid without a title"
  end
end
