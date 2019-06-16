class Pencil
    attr_accessor(:original_point, :current_point, :eraser, :length)
        
    def initialize(point, eraser, length)
        @original_point = point
        @current_point = point
        @eraser = eraser
        @length = length
    end

    def write(paper, full_string)
        characters = full_string.chars
        characters.each do |character|
            if @current_point > 0
                paper.write(character)
                @current_point -= value_character(character) unless (character == " " || character == "\n")
            else
                paper.write(" ")
            end
        end
    end

    def erase(paper, substring)
        paper.erase(substring)
    end

    def sharpen
        if @length > 0
            @current_point = @original_point
            @length -= 1
        end
    end

    def value_character(character)
        character == character.downcase ? 1 : 2
    end
end