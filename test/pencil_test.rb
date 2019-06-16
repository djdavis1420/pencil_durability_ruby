require "minitest/autorun"
require_relative "../lib/pencil"
require_relative "../lib/paper.rb"

class TestPencil < Minitest::Test

    def setup
        @pencil = Pencil.new(500, 100, 10)
        @paper = Paper.new
        @full_string = "She sells sea shells down by the sea shore"
    end

    def test__pencil_is_instantiated_with_properties
        assert_equal 500, @pencil.original_point
        assert_equal 500, @pencil.current_point
        assert_equal 100, @pencil.eraser
        assert_equal 10, @pencil.length
    end

    def test_write__pencil_writes_characters_to_paper
        @pencil.write(@paper, @full_string)
        assert_equal @full_string, @paper.content
    end

    def test_write__pencil_point_should_degrade_while_writing_non_whitespace_characters
        @pencil.write(@paper, @full_string)
        assert_equal 465, @pencil.current_point
        assert_equal @full_string, @paper.content
    end

    def test_write__pencil_should_write_spaces_when_point_degrades_to_zero
        @pencil.current_point = 20
        expected_string = "She sells sea shells do                   "

        @pencil.write(@paper, @full_string)

        assert_equal 0, @pencil.current_point
        assert_equal expected_string, @paper.content
    end

    def test_erase__pencil_erases_characters_from_paper_and_degrades_eraser
        @paper.content = @full_string
        substring = "sea"
        expected_string = "She sells sea shells down by the     shore"

        @pencil.erase(@paper, substring)

        assert_equal expected_string, @paper.content
        assert_equal 97, @pencil.eraser
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

    def test_sharpen__pencil_should_not_sharpen_because_length_is_zero
        @pencil.current_point = 1
        @pencil.length = 0

        @pencil.sharpen

        assert_equal 0, @pencil.length
        assert_equal 1, @pencil.current_point
    end

    def test_value_character__should_return_appropriate_value_for_character_case
        lower_case_character = "x"
        upper_case_character = "X"
        actual_lower = @pencil.value_character(lower_case_character)
        actual_upper = @pencil.value_character(upper_case_character)
        assert_equal 1, actual_lower
        assert_equal 2, actual_upper
    end
end