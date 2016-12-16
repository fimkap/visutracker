class Article < ApplicationRecord
    belongs_to :user
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates :title, presence: true, length: { minimum: 5 }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
