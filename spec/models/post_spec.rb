require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe "Create a Post" do
    subject { described_class.new(user_id: user.id, title: 'title', body: 'body' ) }
    let(:user) { User.create(name: 'Name', email: 'Email@gmail.com', password: 'Super_secure_pass')}
    
  	context "correct attributes are given" do
  	  it "must have a title and a body" do
	  	expect(subject).to be_valid
  	  end
    end

    context "incorrect attributes are given" do
        subject { described_class.new }
  	  it "doesn't have a title or a body" do
	  	expect(subject).to be_invalid
  	  end
    end

  end
end