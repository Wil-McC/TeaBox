class Tea < ApplicationRecord
  has_many :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions

  validates_presence_of :title, :temp_c, :brew_for, :tier
end
