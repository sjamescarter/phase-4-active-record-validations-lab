class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait, on: :create

  private
  def clickbait
    phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    result = false
    phrases.each { |phrase| result = true if title.include?(phrase) }
    if result != true
        errors.add(:title, "Not valid clickbait")
    end
  end
end
