require "minitest/autorun"
require_relative "../lib/pencil"
require_relative "../lib/paper.rb"

class TestPencil < Minitest::Test

    def setup
        @pencil = Pencil.new(500, 100, 10)
        @paper = Paper.new
    end

    def test__pencil_is_instantiated_with_properties
        assert_equal 500, @pencil.original_point
        assert_equal 500, @pencil.current_point
        assert_equal 100, @pencil.eraser
        assert_equal 10, @pencil.length
    end

    def test_write__pencil_writes_characters_to_paper
        characters = "She sells sea shells down by the sea shore"
        @pencil.write(@paper, characters)
        assert_equal characters, @paper.content
    end

    def test_write__pencil_point_should_degrade_while_writing_non_whitespace_characters
        characters = "She sells sea shells down by the sea shore"
        @pencil.write(@paper, characters)
        assert_equal 466, @pencil.current_point
        assert_equal characters, @paper.content
    end

    def test_sharpen__pencil_point_should_reset_to_original_value
        @pencil.current_point = 1
        @pencil.sharpen
        assert_equal @pencil.original_point, @pencil.current_point
    end

    def test_sharpen__pencil_length_should_decrement_when_sharpened
        @pencil.sharpen
        assert_equal 9, @pencil.length
    end
end