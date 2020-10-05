class PlanSpotsController < ApplicationController

    def create 
        @plan_spot = PlanSpot.new(plan_spot_params)
        if @plan_spot.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy 
        @plan_spot = PlanSpot.find_by(plan_id: params[:plan_id], spot_id: params[:spot_id])
        @plan_spot.destroy 
        redirect_back(fallback_location: root_path)
    end

    def plan_spot_params
        params.permit(:plan_id,:spot_id)
    end
end
