class Post < ApplicationRecord
    # All posts have a title
    validates :title, presence: true
    validate :clickbait_title
  
    # Post content is at least 250 characters long
    validates :content, length: { minimum: 250 }
  
    # Post summary is a maximum of 250 characters
    validates :summary, length: { maximum: 250 }
  
    # Post category is either Fiction or Non-Fiction.
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  
    private
  
    def clickbait_title
      unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.match?(/\bTop \d+\b/) || title.include?("Guess"))
        errors.add(:title, "must be clickbait-y!")
      end
    end
  end
  