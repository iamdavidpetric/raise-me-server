module V1
	class TodaysProjectController < ApiController
    def index
      yesterday_invested_projects = Project.all.sort_by {|project| project.yesterdays_investors_number }
      render json: yesterday_invested_projects.reverse.first(4)
    end

    def show
      sorted_projects = Project.all.sort_by { |project| project.achieved_goal_percentage}
      render json: sorted_projects.last
    end
  end
end
