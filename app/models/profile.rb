class Profile < ActiveRecord::Base
  belongs_to :user

  validate :last_and_first
  validate :boy_named_sue

  validates :gender, inclusion: { in: %w(male female),
    message: "%{value} is not a valid gender" }

  def boy_named_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name, 'A boy cannot be named Sue')
    end
  end

  def last_and_first
    if last_name.nil? && first_name.nil?
      errors.add(:last_name, 'last name and first name cannot be null!')
    end
  end

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN :min_year AND :max_year", min_year: min, max_year: max).order(birth_year: :asc)
  end
end
