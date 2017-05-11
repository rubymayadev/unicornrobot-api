require 'rails_helper'

#Test suite for user model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Interest model
  it { should have_many(:interests).dependent(:destroy) }

  # Validation tests
  # ensure columns email, username, password and created_by are present before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
end
