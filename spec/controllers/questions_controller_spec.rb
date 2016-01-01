require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  let(:my_question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true)}

  describe "GET #index" do
    it "1. returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

  it "2. assigns [my_question] to @questions" do
    get :index
    expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET new" do
    it "3. returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "4. renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "5. instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "QUESTION create" do
    it "6. increases the number of Questions by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}}.to change(Question,:count).by(1)
    end
    #what are :create, post:

    it "7. assigns the new question to @question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}
      expect(assigns(:question)).to eq Question.last
    end

    it "8. redirects to the new question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true}
      expect(response).to redirect_to Question.last
    end
  end


  #bloc is confusing me here .. delete or comment out.  I'm going to copy and past the comments in.
  #perhaps I need this in the future

    describe "GET show" do
      it "9. returns http success" do
        get :show, {id: my_question.id}
        expect(response).to have_http_status(:success)
      end

      it "10. renders the #show view" do
        get :show, {id: my_question.id}
        expect(response).to render_template :show
      end

      it "11. assigned my_question to @question" do
        get :show, {id: my_question.id}
        expect(assigns(:question)).to eq(my_question)
      end
    end

    describe "GET edit" do
      it "12. returns http success" do
        get :edit, {id: my_question.id}
        expect(response).to have_http_status(:success)
      end

      it "13. renders the #edit view" do
        get :edit, {id: my_question.id}
        expect(response).to render_template :edit
      end

      it "14. assigns post to be updated to @question" do
        get :edit, {id: my_question.id}

        question_instance = assigns(:question)

        expect(question_instance.id).to eq my_question.id
        expect(question_instance.title).to eq my_question.title
        expect(question_instance.body).to eq my_question.body
        expect(question_instance.resolved).to eq true
      end

      describe "PUT update" do
        it "15. updates question with expected attributes" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph
          new_resolved = true

          put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved}

          updated_question = assigns(:question)
          expect(updated_question.id).to eq my_question.id
          expect(updated_question.title).to eq new_title
          expect(updated_question.body).to eq new_body
          expect(updated_question.resolved).to eq new_resolved
        end

        it "16. redirects to the updated question" do
          new_title = RandomData.random_sentence
          new_body = RandomData.random_paragraph
          new_resolved = true

          put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: new_resolved}
          expect(response).to redirect_to my_question
        end
      end

      describe "DELETE destroy" do
        it "17. deletes the question" do
          delete :destroy, {id: my_question.id}

          count = Question.where({id: my_question.id}).size
          expect(count).to eq 0
        end

        it "18. redirects to questions index" do
          delete :destroy, {id: my_question.id}

          expect(response).to redirect_to questions_path
        end
      end
    end







  end
