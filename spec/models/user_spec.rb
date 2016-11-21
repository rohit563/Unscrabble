require 'spec_helper'
require 'rails_helper'

describe User do

  before(:each) do
 @user = User.new( email: "dongrida@dongdong.com", password: "foobar", password_confirmation: "foobar") 
  end
     subject { @user }

  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
    end
   
      context  "is invalid without an email" do
       before { @user.email = "" }
        it { should_not be_valid }
      end
      
  context "validations" do
    before { create(:user) }

    context "presence" do
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
      end
      
      context  "password and password_confirmation should match" do
       before { @user.password = "123456" , @user.password_confirmation = "1234562"}
        it { should_not be_valid }
      end
      
      context  "password length should be at least 6" do
       before { @user.password = "123456" , @user.password_confirmation = "12345"}
        it { should_not be_valid }
      end

    context "uniqueness" do
      it { should validate_uniqueness_of(:email).case_insensitive}
    end
  end
end