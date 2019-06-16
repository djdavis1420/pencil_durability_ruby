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
            if @current_point > 0
                paper.write(character)
                @current_point -= 1 unless (character == " " || character == "\n")
            else
                paper.write(" ")
            end
        end
    end

    def sharpen
        if @length > 0
            @current_point = @original_point
            @length -= 1
        end
    end

end