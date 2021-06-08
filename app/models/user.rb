class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :address ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def full_name
    "#{first_name} #{last_name}"
  end
end
