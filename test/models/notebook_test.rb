require 'test_helper'

class NotebookTest < ActiveSupport::TestCase
  test "notebooks must have a title" do
    notebook = Notebook.new
    assert notebook.invalid?
  end
  test "notebooks can count their notes" do
    notebook = notebooks(:notebook_one)
    # there are two notes fixtures for notebook_one
    assert_equal notebook.notes.count, 2
  end
end
