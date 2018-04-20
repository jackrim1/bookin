class DashboardController < ApplicationController

def show
end

def index
end



private

 def dashboard_params
  params.require(:user_id).permit(:mess_id, :alacarte, :id)
end

end
