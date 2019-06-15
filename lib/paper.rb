class Paper
    attr_accessor(:content)

    def initialize
        @content = ""
    end

    def write(characters)
        @content = @content + characters
    end
end