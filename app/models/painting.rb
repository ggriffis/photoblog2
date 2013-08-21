class Painting < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :image, :remote_image_url
  belongs_to :gallery
  mount_uploader :image, ImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      painting = Painting.find(id)
      painting.key = key
      #painting.process_photo_upload = true
      painting.remote_image_url = painting.image.direct_fog_url(with_path: true)
      painting.save!
      painting.update_column(:image_processed, true)
    end
  end
end
