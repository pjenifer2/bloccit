require 'rails_helper'
include RandomData

RSpec.describe PostsController, type: :controller do
  let(:my_post) {Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

      it "assigns [my_post] to @posts" do
        #create posts
        50.times do
          Post.create!(
          title: RandomData.random_sentence,
          body: RandomData.random_paragraph
          )
        end

        get :index
        posts = assigns(:posts)

          posts.each_with_index do |post, index|
            if (index + 1) % 5 == 0

              expect(post.title).to eq("spam")
            else
            
              expect(post.title).not_to eq("spam")
            end
          end
      end
    end
end
  #bloc is confusing me here .. delete or comment out.  I'm going to copy and past the comments in.
  #perhaps I need this in the future

  #  describe "GET show" do
  #    it "returns http success" do
  #      get :show
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  #  describe "GET edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end
