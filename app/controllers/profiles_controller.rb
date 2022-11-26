class ProfilesController < ApplicationController

    def show
      @profile = Profile.find(params[:id])
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
      @profile = Profile.find(params[:id])
        if @profile.update(profile_params)
          redirect_to @profile
        else
          render :edit
        end
    end

    def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy
    end

private

    def profile_params
      params.require(:profile).permit(:name,:city,:gender,:age,:user_id)
    end
end
