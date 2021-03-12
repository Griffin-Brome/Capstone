class ExampleusersController < ApplicationController
  before_action :set_exampleuser, only: %i[ show edit update destroy ]

  # GET /exampleusers or /exampleusers.json
  def index
    @exampleusers = Exampleuser.all
  end

  # GET /exampleusers/1 or /exampleusers/1.json
  def show
  end

  # GET /exampleusers/new
  def new
    @exampleuser = Exampleuser.new
  end

  # GET /exampleusers/1/edit
  def edit
  end

  # POST /exampleusers or /exampleusers.json
  def create
    @exampleuser = Exampleuser.new(exampleuser_params)

    respond_to do |format|
      if @exampleuser.save
        format.html { redirect_to @exampleuser, notice: "Exampleuser was successfully created." }
        format.json { render :show, status: :created, location: @exampleuser }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exampleuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exampleusers/1 or /exampleusers/1.json
  def update
    respond_to do |format|
      if @exampleuser.update(exampleuser_params)
        format.html { redirect_to @exampleuser, notice: "Exampleuser was successfully updated." }
        format.json { render :show, status: :ok, location: @exampleuser }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exampleuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exampleusers/1 or /exampleusers/1.json
  def destroy
    @exampleuser.destroy
    respond_to do |format|
      format.html { redirect_to exampleusers_url, notice: "Exampleuser was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exampleuser
      @exampleuser = Exampleuser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exampleuser_params
      params.require(:exampleuser).permit(:email, :password)
    end
end
