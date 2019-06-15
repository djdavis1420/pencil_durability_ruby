require "minitest/autorun"
require_relative "../lib/pencil"

class TestPencil < Minitest::Test

    def setup
        @pencil = Pencil.new(500, 100, 10)
    end

    def test__pencil_is_instantiated_with_properties
        assert_equal 500, @pencil.original_point
        assert_equal 500, @pencil.current_point
        assert_equal 100, @pencil.eraser
        assert_equal 10, @pencil.length
    end
end