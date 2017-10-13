require 'bundler/setup'
Bundler.require
require 'active_record'
require 'action_view'
require 'erb'
include ActionView::Helpers::TextHelper

Dir[File.expand_path('../libs', __FILE__) << '/*.rb'].each do |file|
  require file
end

Pages.all.each do |page|
  f = File.open("_posts/#{page.date.strftime('%Y-%m-%d')}-tabi.markdown", 'w')
  Pages.columns_hash.each_key do |key|
    eval("@#{key} = page.#{key}")
  end
  f.puts ERB.new(File.open('./libs/page.erb').read).result
  f.close
end
