class Category < ApplicationRecord
  has_many :products
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', optional: true
  def self.ransackable_associations(auth_object = nil)
    ["parent", "products", "subcategories"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "parent_id", "updated_at"]
  end
end
