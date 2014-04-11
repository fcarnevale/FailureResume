class ResumesController < ApplicationController
  before_action :load_user, except: :show
  before_action :load_new_resume, only: :new
  before_action :load_resume_and_user, only: :show

  def home
    # FIXME: temporary implementation until login gets added
    if @user.resume
      redirect_to resume_path(@user.resume)
    else
      redirect_to action: :new
    end
  end

  def new
  end

  def show
  end

  private
    def load_user
      # FIXME: temporary implementation for testing
      @user = User.last
    end

    def load_new_resume
      # FIXME: temporary implementation for testing
      @resume = @user.build_resume
      3.times { @resume.failures.build }
    end

    def load_resume_and_user
      @resume = Resume.find(params[:id])
      @user = @resume.user
      @failures = @resume.failures
    end

    end
end
