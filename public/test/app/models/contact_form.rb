class ContactForm < ActiveRecord::Base

  before_save { self.email = email.downcase }

  do_not_validate_attachment_file_type :attachment
  has_attached_file :attachment

  validates :name, presence: true, length: { maximum: 100, }
  validates :subject, presence: true, length: { maximum: 100, }
  validates :massage, presence: true, length: { maximum: 300, }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX }



end
