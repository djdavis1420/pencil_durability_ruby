class Pencil
    attr_accessor(:original_point, :current_point, :eraser, :length)
        
    def initialize(point, eraser, length)
        @original_point = point
        @current_point = point
        @eraser = eraser
        @length = length
    end

    def write(paper, characters)
        character_list = characters.chars
        character_list.each do |character|
            paper.write(character)
            @current_point -= 1 unless (character == " " || character == "\n")
        end
    end

    def sharpen
        @current_point = @original_point
    end

end