require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "New question title", body: "New question body")}
  let(:answer) { Answer.create!(body: 'Comment', question: question)}
  describe "answer" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end

end
