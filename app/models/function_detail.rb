class FunctionDetail < ActiveRecord::Base
	has_one :price, dependent: :destroy
end
