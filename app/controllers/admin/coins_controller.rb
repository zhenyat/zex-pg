class Admin::CoinsController < Admin::BaseController
  before_action :set_coin, only: [:show, :edit, :update,:destroy]

  def index
    @coins = policy_scope(Coin)
  end

  def show
    authorize @coin
  end

  def new
    @coin = Coin.new
    authorize @coin
  end

  def edit
    authorize @coin
  end

  def create
    @coin = Coin.new(coin_params)
    authorize @coin
    if @coin.save
      flash[:success] = t('messages.created', model: @coin.class.model_name.human)
      redirect_to [:admin, @coin]
    else      
      render :new
    end
  end

  def update
    authorize @coin
    if @coin.update(coin_params)
      flash[:success] = t('messages.updated', model: @coin.class.model_name.human)
      redirect_to [:admin, @coin]
    else      
      render :edit
    end
  end

  def destroy
    authorize @coin
    @coin.destroy
    flash[:success] = t('messages.deleted', model: @coin.class.model_name.human)
    redirect_to admin_coins_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def coin_params
      params.require(:coin).permit(:name, :code, :kind, :status)
    end
end
