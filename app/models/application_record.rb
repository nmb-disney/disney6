class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    enum status: { 販売中: 0, 販売停止中:1, 商品準備中:2 }
    # enum stock: { 在庫あり: 0, 在庫なし: 1 }
end
