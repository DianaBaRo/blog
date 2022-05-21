# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentReaction, type: :model do
  describe 'CommentReaction associations' do
    it { should belong_to(:comment) }
    it { should belong_to(:reaction) }
  end

  describe 'Create a CommentReaction' do
    let(:post) { Post.create(user_id: user.id, title: 'title', body: 'body') }
    let(:user) { User.create(name: 'Name', email: 'Email@gmail.com', password: 'Super_secure_pass') }
    let(:comment) { Comment.create(user_id: user.id, post_id: post.id, content: 'Content') }
    let(:reaction) { Reaction.create(emoji: 'emoji', user_id: user.id, comment_id: comment.id) }
    subject { described_class.new(reaction_count: 1, comment_id: comment.id, reaction_id: reaction.id) }

    context 'correct attributes are given' do
      it 'must have reaction_count' do
        expect(subject).to be_valid
      end
    end

    context 'incorrect attributes are given' do
      subject { described_class.new }
      it "doesn't have reaction_count" do
        expect(subject).to be_invalid
      end
    end
  end
end
