class Article < ActiveRecord::Base

  translates :title, :text, :short_description

  before_validation :add_default_permalink

  do_not_validate_attachment_file_type :attachment, :default_url => "/images/:style/missing.png"
  has_attached_file :attachment

  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  validates :short_description, presence: true, length: { maximum: 2000 }


  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("articles.position ASC") }
  scope :newest_first, lambda { order("articles.created_at DESC").limit(6)}
  scope :sorted_new, lambda { order("articles.created_at DESC")}

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{title.tr(' ', '_').downcase.parameterize}"
    end
  end



end
