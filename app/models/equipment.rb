class Equipment < ApplicationRecord
  has_one_attached :main_image

  has_many :assigns, as: :assignable, dependent: :destroy
  has_many :contracts, through: :assigns



  scope :available, -> { where("available > ?", 0) }
  scope :added, -> { where("available = ?", 0) }


  belongs_to :category

  def testtest
    puts url_for(self.main_image)
  end

end
