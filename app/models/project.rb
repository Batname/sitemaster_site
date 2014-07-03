class Project < ActiveRecord::Base

  translates :title, :text, :short_description

  before_validation :add_default_permalink

  has_many :works
  has_many :services, through: :works

  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  validates :short_description, presence: true, length: { maximum: 120 }


  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("articles.position ASC") }
  scope :newest_first, lambda { order("articles.created_at DESC").limit(6)}


  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = "#{id}-#{name.parameterize}"
    end
  end
end
