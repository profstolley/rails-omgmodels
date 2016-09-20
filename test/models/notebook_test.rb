require 'test_helper'

class NotebookTest < ActiveSupport::TestCase
  test "notebooks must have a title" do
    notebook = Notebook.new
    assert notebook.invalid?
  end
end
