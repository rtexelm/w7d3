require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:incomplete_user) {
    User.new(
      username: "",
      password: "password"
    )
  }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

   describe "validates the uniqueness of" do 
      before :each do 
        create(:user)
      end   

      it { should validate_uniqueness_of(:username) }
    end 

    # describe "user associations" do 
    #   it { should have_many(:chirps) }
    # end 

    describe "is_password?" do 
      let(:user) { create(:user) }

      context "with a valid password" do 
        it "should return true" do 
          expect(user.is_password?("starwars")).to be true
        end 
      end
    end

    describe "password encryption" do
      it "does not save passwords to the database" do 
        FactoryBot.create(:harry_potter)
        user = User.find_by(username: "Harry Potter")
        expect(user.password).not_to eq('starwars')
      end 

      it "encrypts password using BCrypt" do 
        expect(BCrypt::Password).to receive(:create).with("abcdef")

        FactoryBot.build(:user, password: "abcdef")
      end 
    end 

end
