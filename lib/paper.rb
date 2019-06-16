class Paper
    attr_accessor(:content)

    def initialize
        @content = ""
    end

    def write(characters)
        @content = @content + characters
    end

    def erase(substring, eraser)
        substring_length = substring.length
        beginning_index = @content.rindex(substring)
        ending_index = beginning_index + substring_length - 1
        content_list = @content.chars

        i = ending_index
        e = eraser
        while e > 0 && i >= beginning_index
            content_list[i] = " "
            i -= 1
            e -= 1
        end

        @content = content_list.join("")
    end

    def edit(new_substring, starting_index)
        content_list = @content.chars
        substring_list = new_substring.chars

        i = starting_index
        substring_list.each do |character|
            content_list[i] == " " \
                ? content_list[i] = character \
                : content_list[i] = "@"
            i += 1
        end

        @content = content_list.join("")
    end

end