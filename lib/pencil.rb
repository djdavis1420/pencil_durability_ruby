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
                @current_point -= value_character(character) \
                    unless (character == " " || character == "\n")
            else
                paper.write(" ")
            end
        end
    end

    def erase(paper, substring)
        paper.erase(substring, @eraser)
        @eraser >= substring.length \
            ? @eraser -= substring.length \
            : @eraser = 0
    end

    def sharpen
        if @length > 0
            @current_point = @original_point
            @length -= 1
        end
    end

    def edit(paper, new_substring, starting_index)
        paper.edit(new_substring, starting_index)
        @current_point -= value_substring(new_substring)
    end

    def value_character(character)
        character == character.downcase ? 1 : 2
    end

    def value_substring(substring)
        substring_list = substring.chars
        total = 0
        substring_list.each do |character|
            total += value_character(character)  \
                unless (character == " " || character == "\n")
        end
        total
    end
end