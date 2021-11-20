class ImageUploader < CarrierWave::Uploader::Base
  include carrierwave::minimagick
  process resize_to_limit: [300, 200]

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
