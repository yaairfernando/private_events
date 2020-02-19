class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have created an account!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    puts "====================="
    puts params.inspect
    puts params[:coming].class
    puts "====================="
    if params[:coming] == 'true'
      puts "++++++++++++++++++++++++"
      puts "++++++++++++++++++++++++"
      puts "++++++++++++++++++++++++"
      puts "++++++++++++++++++++++++"
      @events = @user.upcoming_events
    elsif params[:coming] == 'false'
      puts '------------------------'
      puts '------------------------'
      puts '------------------------'
      puts '------------------------'
      @events = @user.previous_events
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
