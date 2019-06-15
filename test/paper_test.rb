require "minitest/autorun"
require_relative "../lib/paper"

class TestPaper < Minitest::Test

    def setup
        @paper = Paper.new
    end

    def test__paper_is_instantiated_with_properties
        assert_equal "", @paper.content
    end

    def test_write__paper_updates_content_property_when_given_characters
        characters = "She sells sea shells down by the sea shore"
        @paper.write(characters)
        assert_equal characters, @paper.content
    end
end