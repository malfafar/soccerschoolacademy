class DocumentsController < ApplicationController
  before_action :authenticate_coach!, except: [:show_documents]
  before_action :check_permission, only: [:show_documents]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  layout 'admin'
  # GET /documents
  # GET /documents.json
  def index
    params.permit(:search)
    if params[:search]
      @documents = Kaminari.paginate_array(Document.search(params[:search])).page(params[:page]).per(30)
    else
      @documents = Document.page(params[:page]).per(30)
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  def show_documents
    @documents = Document.order(:level).page(params[:page]).per(30)
  end
  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update_attributes(document_params)
        format.html { redirect_to documents_path, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:file, :level, :file_file_name)
    end

    def check_permission
      respond_to  do |format|
        if coach_signed_in?
          format.html {redirect_to documents_path}
        elsif guardian_auth_signed_in?
          format.html {}
        elsif player_auth_signed_in?
          format.html {}
        else
          format.html {redirect_to root_path, alert: "You have no permissions to see this"}
        end
      end
    end
end
