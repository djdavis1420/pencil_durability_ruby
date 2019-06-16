require "minitest/autorun"
require_relative "../lib/paper"

class TestPaper < Minitest::Test

    def setup
        @paper = Paper.new
        @full_string = "She sells sea shells down by the sea shore"
    end

    def test__paper_is_instantiated_with_properties
        assert_equal "", @paper.content
    end

    def test_write__paper_updates_content_property_when_given_characters
        @paper.write(@full_string)
        assert_equal @full_string, @paper.content
    end

    def test_write__paper_appends_to_content_property_when_given_characters
        @paper.content = "She sells sea shells "
        characters = "down by the sea shore"

        @paper.write(characters)

        assert_equal @full_string, @paper.content
    end

    def test_erase__paper_should_erase_last_occurrence_of_substring_in_full_with_full_eraser
        @paper.content = @full_string
        eraser = 100
        substring = "sea"
        expected_string = "She sells sea shells down by the     shore"

        @paper.erase(substring, eraser)

        assert_equal expected_string, @paper.content
    end

    def test_erase__paper_should_erase_last_occurrence_of_substring_in_part_due_to_eraser_degradation
        @paper.content = @full_string
        eraser = 2
        substring = "sea"
        expected_string = "She sells sea shells down by the s   shore"

        @paper.erase(substring, eraser)

        assert_equal expected_string, @paper.content
    end
end