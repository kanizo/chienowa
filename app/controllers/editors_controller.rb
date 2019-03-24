class EditorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editor, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]

  # GET /editors
  # GET /editors.json
  def index
    if user_signed_in?
      @editor = current_user.editors.build  
      @editors = current_user.editors.order('created_at DESC').page(params[:page])
    end
  end

  # GET /editors/1
  # GET /editors/1.json
  def show
    @editor = Editor.find(params[:id])
    @problems = @editor.problems.order('created_at DESC')
  end

  # GET /editors/new
  def new
    @editor = Editor.new
    @editor.problems.build
  end

  # GET /editors/1/edit
  def edit
  end

  # POST /editors
  # POST /editors.json
  def create
    @editor = current_user.editors.build(editor_params)

    respond_to do |format|
      if @editor.save
        format.html { redirect_to @editor, notice: 'Editor was successfully created.' }
        format.json { render :show, status: :created, location: @editor }
      else
        format.html { render :new }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editors/1
  # PATCH/PUT /editors/1.json
  def update
    respond_to do |format|
      if @editor.update(editor_params)
        format.html { redirect_to @editor, notice: 'Editor was successfully updated.' }
        format.json { render :show, status: :ok, location: @editor }
      else
        format.html { render :edit }
        format.json { render json: @editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editors/1
  # DELETE /editors/1.json
  def destroy
    @editor.destroy
    respond_to do |format|
      format.html { redirect_to editors_url, notice: 'Editor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor
      @editor = Editor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_params
      params.require(:editor).permit(:title, :description,
                                     problems_attributes: [:question,:answer, :_destroy])
    end
    
    def correct_user
      @editor = current_user.editors.find_by(id: params[:id])
      unless @editor
        redirect_to root_url
      end
    end
end
