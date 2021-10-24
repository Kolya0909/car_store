class Car < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, length:{minimum: 3}
  validates :series, presence: true, length:{minimum:3}
  validates :image, presence: true
  validates :price, presence: true
  validates :probeg, presence: true
  validates :motor, presence: true
  validates :privod, presence: true
  validates :kpp, presence: true
  validates :city, presence: true
  validates :telephone, presence: true
  validates :info, presence: true, length:{minimum: 10}
  validates :stan, presence: true, length:{minimum: 5}

  def self.search(params)
    where("LOWER(name) LIKE ? OR LOWER(series) LIKE ? OR LOWER(city) LIKE ?", "%#{params}%" ,"%#{params}%", "%#{params}%")
  end

  def self.filterName(name)
    where("name = ?", name)
  end

  def self.getCarName
    cars = Car.all
    array = []
    cars.each do |car|
      array.push(car.name)
    end
    array.push('Усі авто')
    return array.to_set
  end

end
