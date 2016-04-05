class Profile < ActiveRecord::Base
  belongs_to :user

  validate :last_and_first

  validates :gender, inclusion: { in: %w(male female),
    message: "%{value} is not a valid gender" }


  def last_and_first
    if last_name.nil? && first_name.nil?
      errors.add(:last_name, 'last name and first name cannot be null!')
    end
  end
end
