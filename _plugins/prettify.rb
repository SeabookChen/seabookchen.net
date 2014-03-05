module Jekyll

  class PrettifyBlock < Liquid::Block
    include Liquid::StandardFilters

    SYNTAX = %r{^([a-zA-Z0-9.+#-])*$}

    def initialize(tag_name, markup, tokens)
      super
      if markup.strip =~ SYNTAX
          @lang = " lang-#{markup.strip.downcase}"
      else
          raise SyntaxError.new <<-eos
Syntax Error in tag 'prettify' while parsing the following markup:

  #{markup}

Valid syntax: prettify [lang]
eos
      end
    end

    def render(context)
      code = h(super).strip

      <<-HTML
<div><pre class="prettyprint#{@lang}"><code>#{code}</code></pre></div>
      HTML
    end
  end

end

Liquid::Template.register_tag('prettify', Jekyll::PrettifyBlock)