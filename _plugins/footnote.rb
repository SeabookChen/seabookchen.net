module Jekyll
  module Tags
    class FootnoteBlock < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super
        if text.strip =~ /^\d+$/
          @num = text.strip
        else
          raise SyntaxError.new("Unexpected arguments. #{text}")
        end
      end

      def render(context)
        "<sup><a href=\"#footnote-#{@num}\">[#{@num}]</a></sup>"
      end
    end
  end
end

Liquid::Template.register_tag('footnote', Jekyll::Tags::FootnoteBlock)