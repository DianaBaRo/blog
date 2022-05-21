require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'Reaction associations' do
    it { should belong_to(:user) }
    it { should belong_to(:comment) }
  end

  describe "Create a Reaction" do
    let(:post) { Post.create(user_id: user.id, title: 'title', body: 'body') }
    let(:user) { User.create(name: 'Name', email: 'Email@gmail.com', password: 'Super_secure_pass')}
    let(:comment) { Comment.create(user_id: user.id, post_id: post.id, content: 'Content') }
    subject { described_class.new(emoji: 'emoji', user_id: user.id, comment_id: comment.id) }

  	
  	context "correct attributes are given" do
  	  it "must have an emoji" do
	  	expect(subject).to be_valid
  	  end
    end

    context "incorrect attributes are given" do
        subject { described_class.new }
  	  it "doesn't have an emoji" do
	  	expect(subject).to be_invalid
  	  end
    end

  end
end