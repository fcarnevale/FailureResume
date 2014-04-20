class ResumesController < ApplicationController
  before_action :load_user
  before_action :load_resume_data, only: [:home, :show]

  def home
    # FIXME: temporary implementation until login gets added
    # if current_user && current_user.resume
    #   render 'show'
    # elsif current_user
    #   redirect_to new_resume_url
    # else
    #   redirect_to signin_url
    # end

    if @resume
      render 'show'
    else
      redirect_to action: :new
    end
  end

  def new
    # This should be something like:
    # before_action :signed_in_restrictions
    # def signed_in_restrictions
    #   redirect_to edit_resume_path(current_user.resume) if signed_in_with_resume?
    #   redirect_to signin_path, flash: { alert: "Please sign in to create a failure resume." } unless current_user
    # end
    # if current_user && current_user.resume
    #   render 'show'
    # elsif current_user
    #   @resume = current_user.build_resume
    #   3.times { @resume.failures.build }
    # else
    #   redirect_to signup_url
    # end  
    
    @resume = @user.build_resume
    3.times { @resume.failures.build }
  end

  def create
    # This should be something like: @resume = current_user.build_resume(resume_params)
    @resume = @user.build_resume(resume_params)

    if @resume.save
      redirect_to resume_path(@resume), flash: { success: "Failure resume created!" }
    else
      render 'new'
    end
  end

  def show
    render text: 'time to implement twitter auth' unless @resume
  end

  private
    def load_user
      # FIXME: temporary implementation for testing
      @user = User.last
    end

    def load_resume_data
      @user = User.find_by(twitter_handle: params[:id])
      @resume = @user.resume if @user
      @failures = @resume.failures if @resume
    end

    def resume_params
      params.require(:resume).permit(:id, failures_attributes: [:id, :description, :lesson])
    end
end
