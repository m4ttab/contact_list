class Contact < ApplicationRecord
	validates :name, :surname, :phone, :address, :phone, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :phone, numericality: true, length: 9..13
end
