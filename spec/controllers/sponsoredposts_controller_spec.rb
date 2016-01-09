require 'rails_helper'
include RandomData

RSpec.describe SponsoredpostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:my_sponsor_post) { my_topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1)}

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id:my_sponsor_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id:my_sponsor_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id:my_sponsor_post.id
      expect(assigns(:sponsoredpost)).to eq(my_sponsor_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "initializes @post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsoredpost)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increates the number of Sponsored Posts by 1" do
      expect{post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}}.to change(Sponsoredpost,:count).by(1)
    end

    it "assigns the new sponsoredpost to @sponsoredpost" do
      post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}
      expect(assigns(:sponsoredpost)).to eq Sponsoredpost.last
    end

    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsoredpost: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 1}
      expect(response).to redirect_to [my_topic, Sponsoredpost.last]
    end

  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id:my_sponsor_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id:my_sponsor_post.id
      expect(response).to render_template :edit
    end

    it "assigns sponsored post to be updated to @sponsoredpost" do
     get :edit, topic_id: my_topic.id, id: my_sponsor_post.id
     sponsored_post_instance = assigns(:sponsoredpost)

     expect(sponsored_post_instance.id).to eq my_sponsor_post.id
     expect(sponsored_post_instance.title).to eq my_sponsor_post.title
     expect(sponsored_post_instance.body).to eq my_sponsor_post.body
     expect(sponsored_post_instance.price).to eq my_sponsor_post.price

    end

  end

  describe "PUT update" do
    it "updates sponsored post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 1

      put :update, topic_id: my_topic.id, id: my_sponsor_post.id, sponsoredpost: {title: new_title, body: new_body, price: 1}

      updated_sponsored_post = assigns(:sponsoredpost)
      expect(updated_sponsored_post.id).to eq my_sponsor_post.id
      expect(updated_sponsored_post.title).to eq new_title
      expect(updated_sponsored_post.body).to eq new_body
      expect(updated_sponsored_post.price).to eq new_price
    end

    it "redirects to the updated sponsor post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 1

      put :update, topic_id: my_topic.id, id: my_sponsor_post.id, sponsoredpost: {title: new_title, body: new_body, price: new_price}
      expect(response).to redirect_to [my_topic, my_sponsor_post]
    end
  end

  describe "DELETE destroy" do
       it "deletes the post" do
         delete :destroy, topic_id: my_topic.id, id: my_sponsor_post.id
         count = Sponsoredpost.where({id: my_sponsor_post.id}).size
         expect(count).to eq 0
       end


       it "redirects to topic show" do
          delete :destroy, topic_id: my_topic.id, id: my_sponsor_post.id
         expect(response).to redirect_to my_topic
       end

   end


end
