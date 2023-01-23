module V1
  class TodaysProjectController < UnauthenticatedApiController
    def index
      yesterday_invested_projects = Project.all.sort_by { |project| project.yesterdays_investors_number }
      render json: yesterday_invested_projects.reverse.first(4)
    end

    def show
      sorted_projects = Project.all.sort_by { |project| project.achieved_goal_percentage }
      render json: sorted_projects.last
    end

    def quick_info
      project_numbers = Project.all.count
      investors_ammount = Investor.all.sum(:ammount)
      investors_all = Investor.all.count
      render json: { total_projects_count: project_numbers, total_ammount_invested: investors_ammount,
                     total_investors_count: investors_all }
    end
  end
end
