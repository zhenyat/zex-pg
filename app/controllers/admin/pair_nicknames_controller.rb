class Admin::PairNicknamesController < Admin::BaseController
  before_action :set_pair_nickname, only: [:show, :edit, :update,:destroy]

  def index
    @pair_nicknames = policy_scope(PairNickname)
  end

  def show
    authorize @pair_nickname
  end

  def new
    @pair_nickname = PairNickname.new
    authorize @pair_nickname
  end

  def edit
    authorize @pair_nickname
  end

  def create
    @pair_nickname = PairNickname.new(pair_nickname_params)
    authorize @pair_nickname
    if @pair_nickname.save
      flash[:success] = t('messages.created', model: @pair_nickname.class.model_name.human)
      redirect_to [:admin, @pair_nickname]
    else      
      render :new
    end
  end

  def update
    authorize @pair_nickname
    if @pair_nickname.update(pair_nickname_params)
      flash[:success] = t('messages.updated', model: @pair_nickname.class.model_name.human)
      redirect_to [:admin, @pair_nickname]
    else      
      render :edit
    end
  end

  def destroy
    authorize @pair_nickname
    @pair_nickname.destroy
    flash[:success] = t('messages.deleted', model: @pair_nickname.class.model_name.human)
    redirect_to admin_pair_nicknames_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_pair_nickname
      @pair_nickname = PairNickname.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def pair_nickname_params
      params.require(:pair_nickname).permit(:pair_id, :name)
    end
end
