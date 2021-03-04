require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

    subject(:toby) {User.create(username: 'Toby', age: 2, email: 'toby@toby.com', password: "123456")}

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:age)}
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }

    it {should validate_uniqueness_of(:username)}
  end

end
