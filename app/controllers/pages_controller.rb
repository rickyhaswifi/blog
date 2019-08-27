class PagesController < ApplicationController
  # view all the pages 
  def index
    @pages = Page.all
    # renders index.html.erb
  end

  # showing a single page
  def show
            # Page.find(3)
    @page = Page.find(params[:id])
     # renders show.html.erb
  end

  # displays the form to create the new page
  def new
    @page = Page.new
    # renders new.html.erb
  end

  # Post request to create the page
  def create
    @page = Page.new(pages_params)

    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  # edit form
  def edit
    @page = Page.fint(params[:id])

  end

  # update the page
  def update
    @page = page.find(params[:id])

    if @page.update(pages_params)
      redirect_to pages_path
    else 
      render :edit  
    end
  end

  def destroy
    Page.find([:id].destroy)
    redirect_to pages_path
  end


  private
    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end