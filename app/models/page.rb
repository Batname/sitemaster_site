class Page < ActiveRecord::Base

  translates :title, :text, :short_description

  before_validation :add_default_permalink

  has_attached_file :attachment
  has_attached_file :other_attachment

  # https://github.com/thoughtbot/paperclip
  do_not_validate_attachment_file_type :attachment
  do_not_validate_attachment_file_type :other_attachment

  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink
  validates :short_description, length: { maximum: 2000 }

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC").limit(6)}
  scope :sorted_new, lambda { order("pages.created_at DESC")}

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{title.tr(' ', '_').downcase.parameterize}"
    end
  end

end

# https://www.ruby-toolbox.com/projects/translit
# About translit
