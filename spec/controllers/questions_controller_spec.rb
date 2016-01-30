require 'rails_helper'
require 'factory_girl'
include Foyer::Controller::Helpers

RSpec.describe QuestionsController, :type => :controller do
  before :each do
    @user = User.new.save!
    sign_in User.find(@user)
    @update_form = FactoryGirl.create(:update_form, :user_id => @user)
    @question = FactoryGirl.create(:question, update_form: @update_form)
    @question_attributes = FactoryGirl.attributes_for(:question, :update_form_id => @update_formr)
    @question_update_attributes = FactoryGirl.attributes_for(:question, :text => "Your updated Question",
                                                             :update_form_id => @update_form)
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested question" do
        put :update, { :update_form_id => @update_form, :id => @question.id, :question => @question_update_attributes }
        @update_form.questions.reload
      end

      it "assigns the requested question as @update_form.question" do
        put :update, { :update_form_id => @update_form, :id => @question.id,
                       :question => @question_update_attributes = FactoryGirl.attributes_for(:question,
                                                    :text => "Your updated Question", :update_form_id => @update_form)}
        expect(assigns(:question).text).to eq(@update_form.questions.find(@question).text)
      end

      it "redirects to @update_form.questions" do
        put :update, { :update_form_id => @update_form, :id => @question.id, :question => @question_update_attributes }
        expect(response).to redirect_to update_form_questions_path(@update_form)
      end
    end
  end
end