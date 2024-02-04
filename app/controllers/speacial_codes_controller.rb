class SpeacialCodesController < ApplicationController
  before_action :set_speacial_code, only: %i[ show edit update destroy ]

  # GET /speacial_codes or /speacial_codes.json
  def index
    @speacial_codes = SpeacialCode.all
  end

  # GET /speacial_codes/1 or /speacial_codes/1.json
  def show
  end

  # GET /speacial_codes/new
  def new
    @speacial_code = SpeacialCode.new
  end

  # GET /speacial_codes/1/edit
  def edit
  end

  # POST /speacial_codes or /speacial_codes.json
  def create
    @speacial_code = SpeacialCode.new(speacial_code_params)

    respond_to do |format|
      if @speacial_code.save
        format.html { redirect_to speacial_code_url(@speacial_code), notice: "Speacial code was successfully created." }
        format.json { render :show, status: :created, location: @speacial_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @speacial_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speacial_codes/1 or /speacial_codes/1.json
  def update
    respond_to do |format|
      if @speacial_code.update(speacial_code_params)
        format.html { redirect_to speacial_code_url(@speacial_code), notice: "Speacial code was successfully updated." }
        format.json { render :show, status: :ok, location: @speacial_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speacial_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speacial_codes/1 or /speacial_codes/1.json
  def destroy
    @speacial_code.destroy!

    respond_to do |format|
      format.html { redirect_to speacial_codes_url, notice: "Speacial code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speacial_code
      @speacial_code = SpeacialCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def speacial_code_params
      params.fetch(:speacial_code, {})
    end
end
