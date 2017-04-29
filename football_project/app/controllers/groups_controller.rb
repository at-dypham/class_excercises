class GroupsController < ApplicationController

 before_action :get_groups, only: :index
 before_action :get_group, only: [:update, :destroy]

 def create
  @group = Group.new group_params
  @tournament = @group.tournament
  if @tournament.check_full_groups
    flash[:danger] = "Số group đã đạt tối đa!!!"
    redirect_to :back
  else
    if @group.save
      flash[:success] = "Thêm thành công"
      redirect_to :back
    else
      flash[:danger] = @group.errors.full_messages
      redirect_to tournament_path @group.tournament_id
    end
  end
end

def update
  if @group.update(group_params)
    flash[:success] = "Sửa thành công"
    redirect_to :back
  else
    get_groups()
    render 'tournaments/index'
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
  params.require(:group).permit :name, :tournament_id
end

def get_groups
  @groups = Group.all
end

def get_group
  @group = Group.find params[:id]
end

end
