class Note < ActiveRecord::Base
  belongs_to :folder
  validates :folder_id, :titulo, :texto, presence: true
end
