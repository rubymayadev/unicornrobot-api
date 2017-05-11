require 'rails_helper'

RSpec.describe Interest, type: :model do
  # Association test
  # ensure an interest record belongs to a singe user record
  it { should belong_to(:user) }
  it { should validate_presence_of(:description) }
end
