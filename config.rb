###
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Haml
###

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# Page command
###

# Per-page layout changes:
#
# With no layout
# page "*", :layout => false

#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def presentation_title
    # set your presentation title here
    "Seconds Investor Deck"
  end

  def presentation_description
    # set your presentation description here
    "text messaging and mobile commerce"
  end

  def some_helper
    "Helping"
  end

  def presentation_slides
    Dir["./source/presentation/*.png"].sort.each_with_index do |img_path, i|
      img_path = img_path.gsub("./source/", "").gsub("/_", "/").gsub(/$_/, "")
      yield img_path, i
    end
  end

  # outputs slides in the slides folders
  def slides(folder = "slides")
    results = []
    Dir["./source/#{folder}/_*.html.*"].each do |slide_path|
      slide_path = slide_path.gsub("./source/", "").gsub("/_", "/").gsub(/$_/, "")
      results << slide_path
    end
    results
  end
end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end