class Contact::GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.groups.find_by(params[:group_id])
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
