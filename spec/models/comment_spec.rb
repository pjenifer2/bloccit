require 'rails_helper'
include RandomData


RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  #additional code for assignment 42
  let(:comment) { Comment.create!(post: 'Comment') }

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:body)}
  it { should validate_length_of(:body).is_at_least(5)}

  #additional code for assignment 42
  it { is_expected.to have_many :commentings }
  it { is_expected.to have_many(:topics).through(:commentings)}
  it { is_expected.to have_many(:posts).through(:commentings)}


  describe "commentings" do
    it "allows the same comment to be associated with a different topic and post" do
      topic.comments << comment
      post.comments << comment

      topic_comment = topic.comment[0]
      post_comment = post.comment[0]

      expect(topic_comment).to eql(post_comment)
    end
    
  end


end
