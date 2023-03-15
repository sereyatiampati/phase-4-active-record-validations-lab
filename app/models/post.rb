class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'], message: "is not included in the list"}

    validate :title_clickbait
    
    def title_clickbait
        unless title =~ /(Won't Believe|Secret|Top \d+|Guess)/
            errors.add(:title, "must be clickbait-y")
        end
    end
end
