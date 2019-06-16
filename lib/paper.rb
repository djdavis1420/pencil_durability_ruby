class Paper
    attr_accessor(:content)

    def initialize
        @content = ""
    end

    def write(characters)
        @content = @content + characters
    end

    def erase(substring)
        substring_length = substring.length
        beginning_index = @content.rindex(substring)
        ending_index = beginning_index + substring_length - 1
        content_list = @content.chars

        i = beginning_index
        while i <= ending_index
            content_list[i] = " "
            i += 1
        end

        @content = content_list.join("")
    end
end