class Game < ActiveRecord::Base
    belongs_to :user
    validates :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, presence: true,  length: {  :is => 1}
end
