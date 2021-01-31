class Book < ApplicationRecord
    belongs_to :bible
    has_many :chapters
end
