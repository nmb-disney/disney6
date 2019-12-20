class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
    enum status: { 在庫あり: 0, 在庫なし: 1 }
end
