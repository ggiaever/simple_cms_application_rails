class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    #Nothing to add I think?
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    if @page.nil?
      redirect_to(root_path)
    else
      #Display as normally with show.html.erb
    end
  end

  private

  def setup_navigation
    @subjects = Subject.visible.sorted
  end

end
