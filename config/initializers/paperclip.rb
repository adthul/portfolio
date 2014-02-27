if Rails.env.production?
  Paperclip::attachment.default_options[:url] = ':s3_path_url'
  Paperclip::attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end
