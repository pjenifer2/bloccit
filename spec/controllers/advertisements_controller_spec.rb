require 'rails_helper'
include AdTest
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advertisement) {Advertisement.create!(title: RandomData.random_word, copy: RandomData.random_sentence, price: 1)}



  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end


  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(assigns(:advertisement)).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).to_not be_nil
    end
  end

  #create
  describe "Ad #create" do
    it "increases the number of Advertisements by 1" do
      expect{post :create, advertisement:{title: RandomData.random_sentence, copy: RandomData.random_word, price: 1}}.to change(Advertisement,:count).by(1)
      #expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)

    end

    #it "increases the number of Post by 1" do
    #  expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    #end

    it "assigns the new advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_word, copy: RandomData.random_sentence, price: 1}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    #it "assigns the new post to @post" do
    #  post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    #  expect(assigns(:post)).to eq Post.last
    #end

    it "redirects to the new post" do
      post :create, advertisement: {title: RandomData.random_word, copy: RandomData.random_sentence, price: 1}
      expect(response).to redirect_to Advertisement.last
    end

    #it "redirects to the new post" do
    #  post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
    #  expect(response).to redirect_to Post.last
    #end
  end



  #show

  describe "GET show" do

    it "returns http success" do

      get :show, {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigned my_post to @post" do
      get :show, {id: my_advertisement.id}
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end





end
