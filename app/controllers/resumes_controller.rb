class ResumesController < ApplicationController
  before_action :load_resume
  
  def home
    # FIXME: temporary (eventually use login/resume status to redirect appropriately)
    render action: :new
  end

  def new
  end

  private

    def load_resume
      # FIXME: temporary implementation for testing
      @user = User.first
      @resume = @user.resume
    end
end
