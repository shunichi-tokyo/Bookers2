class UsersController < ApplicationController
  
  def show
     @user = User.find(params[:id])
    @books = @user.books
    @books = Book.all
  end
  
  def edit
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
