require "minitest/autorun"
require_relative "../lib/paper"

class TestPaper < Minitest::Test

    def setup
        @paper = Paper.new
    end

    def test__paper_is_instantiated_with_properties
        assert_equal "", @paper.content
    end
end