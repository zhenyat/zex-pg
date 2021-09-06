class Admin::PairsController < Admin::BaseController
  before_action :set_pair, only: [:show, :edit, :update,:destroy]

  def index
    @pairs = policy_scope(Pair)
  end

  def show
    authorize @pair
  end

  def new
    @pair = Pair.new
    authorize @pair
  end

  def edit
    authorize @pair
  end

  def create
    @pair = Pair.new(pair_params)
    if @pair.code.nil? then
      @pair.code = @pair.set_pair_code
    end
    if @pair.name.nil? then
      @pair.name = @pair.set_pair_name
    end
    authorize @pair
    if @pair.save
      flash[:success] = t('messages.created', model: @pair.class.model_name.human)
      redirect_to [:admin, @pair]
    else      
      render :new
    end
  end

  def update
    authorize @pair
    if @pair.update(pair_params)
      flash[:success] = t('messages.updated', model: @pair.class.model_name.human)
      redirect_to [:admin, @pair]
    else      
      render :edit
    end
  end

  def destroy
    authorize @pair
    @pair.destroy
    flash[:success] = t('messages.deleted', model: @pair.class.model_name.human)
    redirect_to admin_pairs_path
  end

  private

    # Uses callbacks to share common setup or constraints between actions
    def set_pair
      @pair = Pair.find(params[:id])
    end

    # Only allows a trusted parameter 'white list' through
    def pair_params
      params.require(:pair).permit(:base_id, :quote_id, :name, :code, :level, :decimal_places, :min_price, :max_price, :min_amount, :hidden, :fee, :status)
    end
end
