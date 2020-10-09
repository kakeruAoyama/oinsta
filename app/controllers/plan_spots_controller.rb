class PlanSpotsController < ApplicationController
    before_action :authenticate_user!

    def new
        @plan = Plan.find(params[:plan_id])
        if params[:search].present?
            @spots = Spot.where(['name LIKE ? OR address LIKE ? OR body LIKE ?', '%' + params[:search] + '%', '%' + params[:search] + '%', '%' + params[:search] + '%'])
          else
            @spots = Spot.all
          end
        @plan_spot = PlanSpot.new
    end
    

    def create 
        @plan_spot = PlanSpot.new(plan_spot_params)
        if @plan_spot.save
            redirect_to edit_plan_path(@plan_spot.plan_id)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy 
        @plan_spot = PlanSpot.find_by(plan_id: params[:plan_id], spot_id: params[:spot_id])
        @plan_spot.destroy 
        redirect_back(fallback_location: root_path)
    end

    private
    def plan_spot_params
        params.permit(:plan_id,:spot_id)
    end
end
