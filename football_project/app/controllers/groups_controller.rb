class GroupsController < ApplicationController

 before_action :get_groups, only: :index
 before_action :get_group, only: [:update, :destroy]

 def create
  @group = Group.new group_params
  @group.tournament_id = params[:id]
  if @group.save
    flash[:success] = "Thêm thành công"
    redirect_to :back
  else
    flash[:danger] = @group.errors.messages[:name]
    redirect_to "/tournaments/#{params[:id]}"
  end
end

def update
  if @group.update_attributes(group_params)
    flash[:success] = "Sửa thành công"
    redirect_to "/groups"
  else
    get_groups()
    render 'index'
  end
end

def destroy
  if @group.destroy
    flash[:success] = "Xóa thành công"
  else
    flash[:danger] = "Xóa thất bại"
  end
  redirect_to :back
end

def show
  @groups = Group.where group_id: params[:id]
  get_group()
  @group = Group.new
  @teams = Team.where.not id: (groupTeam.select("team_id").where  group_id: (Group.select("id").where group_id: params[:id]))
end

private
def group_params
  params.require(:group).permit :name
end

def get_groups
  @groups = Group.all
end

def get_group
  @group = Group.find params[:id]
end

end
