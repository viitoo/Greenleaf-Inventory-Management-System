require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should_not allow_value('blah').for(:email) }
  it { should allow_value('bigballscaptain@testicles.me').for(:email) }

  it { should respond_to(:password_confirmation) }
  it { should respond_to(:password) }

  it { should respond_to(:encrypted_password) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:sign_in_count) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:last_sign_in_ip) }
  it { should respond_to(:role) }

  describe 'validation of username' do
    subject { User.new }
    it { should validate_presence_of(:username) }
  end

  describe 'validation of email' do
    subject { FactoryGirl.build(:user, email: nil) }
    it { should validate_presence_of(:email) }
  end

  describe 'valid Model' do
    it 'should be an instance of User Model' do
      expect(user).to be_an_instance_of(User)
    end

    it 'should have a password length btwn 6..40' do
      expect(user.password.length).to be > 6
      expect(user.password.length).to be < 40
    end

    it 'should validate_uniqueness_of email' do
      faked_password = Faker::Internet.password
      expect {
        create(:user, email: user.email, password: faked_password,
         password_confirmation: faked_password)
        }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  # nkotb
  before(:each) do
    @attr = {
      :email => "user@example.com",
      :password => "changeme",
      :password_confirmation => "changeme"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(email: address))
      expect(valid_email_user).to be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(email: address))
      expect(invalid_email_user).to_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).to_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(email: upcased_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).to_not be_valid
  end

  describe "password validations" do
    it "should require a password" do
      expect(User.new(@attr.merge(password: "", password_confirmation: ""))).to_not be_valid
    end

    it "should require a matching password confirmation" do
      expect(User.new(@attr.merge(password_confirmation: "invalid"))).to_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(password: short, password_confirmation: short)
      expect(User.new(hash)).to_not be_valid
    end
  end

end
