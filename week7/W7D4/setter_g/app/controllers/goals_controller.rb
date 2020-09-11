class GoalsController < ApplicationController
    before_action :require_logged_in
    def index
        @my_goals = Goal.find_by(user_id: current_user.id)
        @goals = Goal.where(private: false).where("user_id != ?", current_user.id)
        render :index
    end

    def show
        @goal = Goal.find_by( user_id:current_user.id)
        render :show
    end

    def new
        @goal = Goal.new
        render :new
    end

    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def edit
        @goal = Goal.find_by(id: params[:id])
        render :edit
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])
        @goal.destroy
        redirect_to goals_url
    end

    def update
        @goal = Goal.find_by(id: params[:id])
        if @goal.update
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = @goal.errors.full_messages
            render :edit
        end
    end

    private
    def goal_params    
        params.require(:goal).permit(:name,:body,:user_id,:private,:completed)
    end
end
