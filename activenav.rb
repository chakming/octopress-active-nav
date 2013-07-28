# Active Menu plugin | ChakMing.com | Theory Z Software Engineer
#
# Installation:
# Place this file in your plugin directory.
#
# Usage:
# class="{% activenav /blog [/index.html] %}"
#
# Returns 'active' when the "/blog" occurs in the current page.url
#
# Author: admin@chakming.com
#

module Jekyll
 
  class ActiveNav < Liquid::Tag
    @check_for = nil
 
    def initialize(tag_name, params, tokens)
      @check_for = params.split(" ")
      super
    end
 
    def render(context)
      page_url = context.environments.first["page"]["url"]
      if @check_for.count < 1
        return "<!-- error, expected syntax: {% activenav / %} -->"
      end
      for url in @check_for
        if page_url[0...url.length].eql? url
          if url.length > 1
            output = "active"
          end
        end
      end
      output
    end
  end
end
 
Liquid::Template.register_tag('activenav', Jekyll::ActiveNav)