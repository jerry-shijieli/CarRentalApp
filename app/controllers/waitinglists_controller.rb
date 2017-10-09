class WaitinglistsController < ApplicationController

  # GET /waitinglists
  # GET /waitinglists.json
  def index
    if isAdmin? || isSuperAdmin?
      @waitinglists = Waitinglist.all
    else
      @waitinglists = Waitinglist.where(:user_id => session[:user_id]) || [] # return current user record or empty
    end
  end

  # GET /waitinglists/1
  # GET /waitinglists/1.json
  def show
    @waitinglist = Waitinglist.find(params[:id])
  end

  # GET /waitinglists/new
  def new
    @waitinglist = Waitinglist.new
  end

  # GET /waitinglists/1/edit
  def edit
    @waitinglist = Waitinglist.find(params[:id])
  end

  # POST /waitinglists
  # POST /waitinglists.json
  def create
    # user_id = waitinglist_params[:user_id]
    # user = User.find(user_id)
    if true
      @waitinglist = Waitinglist.new(waitinglist_params)
      if @waitinglist.save
          flash[:success] = 'Email notification was successfully created.'
          # UserMailer.welcome_email(user).deliver
          redirect_to @waitinglist
      end
    end
  end

  # PATCH/PUT /waitinglists/1
  # PATCH/PUT /waitinglists/1.json
  def update
    if @waitinglist.update(waitinglist_params)
      flash[:success] = 'Email notification was successfully updated.'
      redirect_to @waitinglist
    else
      render :edit
    end
  end

  # DELETE /waitinglists/1
  # DELETE /waitinglists/1.json
  def destroy
    @waitinglist = Waitinglist.find(params[:id])
    @waitinglist.destroy
    flash[:success] = 'Email notification deleted!'
    redirect_to waitinglists_url
  end



  def cancel
    @waitinglist = Waitinglist.find(params[:id])
    if @waitinglist.update_attributes(:status => "Cancel")
      flash[:success] = "Email notification was successfully canceled!"
      redirect_to @waitinglist
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_waitinglist
    #   @waitinglist = Waitinglist.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waitinglist_params
      params.require(:waitinglist).permit(:user_id, :car_id, :status)
    end
  
end