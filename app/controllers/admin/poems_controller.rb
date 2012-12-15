#coding=utf-8
class Admin::PoemsController < ApplicationController
  before_filter do |controller|
    controller.authenticated({:role => 'admin', :alert=>'不具备的权限'})
  end
  layout 'admin'
  def index
    @poems = Poem.order(:id).includes(:author).page(params[:page])
  end
  def new
    @poem = Poem.new
    render :template => 'admin/poems/form'
  end
  def create
    @poem = Poem.new(params[:poem])
    @poem.save ? redirect_to(:action => :index) : render(:template => 'admin/poems/form')
  end
  def edit
    @poem = Poem.find(params[:id])
    render :template => 'admin/poems/form'
  end
  def update
    @poem = Poem.find(params[:id])
    @poem.update_attributes(params[:poem]) ? redirect_to(:action => :index) : render(:template => 'admin/poems/form')

  end
  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy
    redirect_to :action => :index
  end
end
