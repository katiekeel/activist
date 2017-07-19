class Contact::GroupsController < ApplicationController
  def index
    @group = Group.find_by(params[:group_id])
  end

  def show
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
