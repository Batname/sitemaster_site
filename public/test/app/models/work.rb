class Work < ActiveRecord::Base
  belongs_to :service
  belongs_to :project
end
