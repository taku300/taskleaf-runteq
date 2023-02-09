class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[edit update show destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to admin_board_path(@board), success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @board.destroy!
    redirect_to admin_boards_path, success: t('defaults.message.deleted', item: Board.model_name.human)
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
end





































class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[edit update show destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def show; end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('defaults.message.deleted', item: User.model_name.human)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache, :role)
  end
end
