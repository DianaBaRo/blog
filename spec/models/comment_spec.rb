# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should have_many(:comment_reactions) }
    it { should have_many(:reactions) }
  end

  describe 'Create a Comment' do
    let(:post) { Post.create(user_id: user.id, title: 'title', body: 'body') }
    let(:user) { User.create(name: 'Name', email: 'Email@gmail.com', password: 'Super_secure_pass') }
    subject { described_class.new(content: 'content', user_id: user.id, post_id: post.id) }

    context 'correct attributes are given' do
      it 'must have content' do
        expect(subject).to be_valid
      end
    end

    context 'incorrect attributes are given' do
      subject { described_class.new }
      it "doesn't have content" do
        expect(subject).to be_invalid
      end
    end
  end
end
