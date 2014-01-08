###
# Compass
###

require "susy"

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

helpers do
  def magic_link_to(link, url, opts={})
      current_url = current_resource.url
      if current_url == url_for(url) || current_url == url_for(url) + "/"
          opts[:class] = "active"
      end
      link_to(link, url, opts)
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :livereload
activate :directory_indexes


activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "s145546.gridserver.com"
  deploy.path     = "/domains/frontdigital.com/html/conservatives/conservatives.com/"
  deploy.user     = "frontdigital.co.uk"
  deploy.password = "fr0ntd1g1t4l12"
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
