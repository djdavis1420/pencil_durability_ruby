class Paper
    attr_accessor(:content)

    def initialize
        @content = ""
    end

    def write(characters)
        @content = characters
    end
end