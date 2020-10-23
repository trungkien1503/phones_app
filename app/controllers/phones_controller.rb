class PhonesController < ApplicationController
  before_action :set_phone, only: %i[show edit update destroy]

  # TODO: Add pagination
  def index
    @phones = Phone.all
  end

  def show; end

  def new
    @phone = Phone.new
  end

  def edit; end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      respond_to do |format|
        format.html { redirect_to phone_path(@phone), notice: 'Phone was successfully created.' }
        format.json { render json: @phone, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to phone_path(@phone), notice: 'Phone was successfully updated.' }
        format.json { render json: @phone, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_path, notice: 'Phone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_phone
    @phone = Phone.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(
      :body_color,
      :data_memory,
      :price,
      :model_id,
    )
  end
end
