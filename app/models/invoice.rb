class Invoice < ApplicationRecord
  has_one :children, class_name: "Invoice", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Invoice", foreign_key: 'parent_id', :optional => true
end
