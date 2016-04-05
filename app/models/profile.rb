class Profile < ActiveRecord::Base
  belongs_to :user

  validate :last_and_first


  def last_and_first
    if last_name.nil? && first_name.nil?
      errors.add(:last_name, 'last name and first name cannot be null!')
    end
  end
end
