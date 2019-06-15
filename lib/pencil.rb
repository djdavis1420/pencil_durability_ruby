class Pencil
    attr_accessor(:original_point, :current_point, :eraser, :length)
        
    def initialize(point, eraser, length)
        @original_point = point
        @current_point = point
        @eraser = eraser
        @length = length
    end

    def write(paper, characters)
        paper.write(characters)
    end

end