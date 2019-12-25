class Order < ApplicationRecord
	belongs_to :user
    has_many :order_cds, dependent: :destroy

enum deliver_status:{ 商品準備中:1, 出荷完了済:2 }
end
