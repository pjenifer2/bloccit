class WelcomeController < ApplicationController
  def index
    @issignedin = current_user.present?
  end

  def about
  end

  def contact
  end

  def faq
  end


end
