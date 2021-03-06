require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)

    raise "double render" if self.already_built_response?
    @already_built_response = true
    @res['Location'] = url
    @res.status = 302

  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)

    raise "double render" if self.already_built_response?
    @already_built_response = true
    @res.write(content)
    @res['Content-Type'] = content_type
    
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    class_name = self.class.to_s.underscore
    template = template_name.to_s

    path = "views/#{class_name}/#{template}.html.erb"

    path = File.join(File.dirname(__FILE__), "..", "views", class_name, "#{template}.html.erb")

    file = File.read(path)

    # p __FILE__
    # p File.dirname(__FILE__)

    # debugger

    content = ERB.new(file).result(binding)

    self.render_content(content, "text/html")
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

