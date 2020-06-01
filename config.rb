# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# locale
page "/zh/*", layout: "layout"
page "/en/*", layout: "layout.en"

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

#data.data.posts.each_with_index do | post |
#  proxy "/zh/posts/#{post.slug}.html", "localizable/post_detail.html", :locals => { :post => post }
#  proxy "/en/posts/#{post.slug}.html", "localizable/post_detail.en.html", :locals => { :post => post }
#end

ignore '/zh/post_detail.html'
ignore '/en/post_detail.html'

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def get_page_meta(meta_key)
    seo_data = Hash[data.data.page_metas.map { |d| [d.meta_key, d] } ]
    seo_data[meta_key]
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# Localization
activate :i18n, :path => "/:locale/", :mount_at_root => false


# Asset pipeline
activate :sprockets

configure :build do
  #build 在子目錄的設定
  #activate :relative_assets
  #set :relative_links, true

  activate :minify_css
  activate :minify_javascript
end

# assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'imgs'
set :fontawesome_fonts_dir, 'fonts'
set :bs_fonts_dir, 'webfonts'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

