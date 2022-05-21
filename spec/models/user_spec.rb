# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:reactions) }
  end

  describe 'Create an User' do
    let(:user) { User.new(attributes) }
    let(:attributes) do
      { name: 'Name',
        email: 'Email@gmail.com',
        password: 'Super_secure_pass',
        admin: true }
    end

    context 'correct attributes are given' do
      it 'have a name, an email and a password' do
        expect(user).to be_valid
      end
    end

    context 'incorrect attributes are given' do
      let(:attributes) {}
      it "doesn't have a name, an email or a password" do
        expect(user).to be_invalid
      end
    end
  end
end
