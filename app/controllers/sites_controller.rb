class SitesController < ApplicationController
  def index
    if session[:user_id] != nil
      user_id = session[:user_id]
      @user = User.find(user_id)
      redirect_to user_buckets_path(@user)
    end
  end

  def about_project
  end

  # def pdf
  #   binding.pry
  #   pdf_filename = File.join(Rails.root, "/app/assets/pdf/wireframefinal.pdf")
  #   send_file(pdf_filename, :filename => "wireframefinal.pdf", :disposition => 'inline', :type => "application/pdf")
  #   @wireframefinal_pdf = wireframefinal.pdf
  # end

end 