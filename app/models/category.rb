class Category < ApplicationRecord
  validates :title, presence: true
  validates :order, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy

  def parent_title
    # it may not have a parent
    parent.try(:title)
  end

  def has_parent?
    parent.present?
  end

  def has_children?
    children.present?
  end
end
