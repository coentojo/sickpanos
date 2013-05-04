class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    puts 'show'
    puts params

    @image = Image.find_by_hashed_url(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    hash = params[:image]
    hash["user_id"] = current_user.id

    
    salt = SecureRandom.hex(6)
    while Image.find_by_hashed_url(salt) do
      salt = SecureRandom.hex(6)
    end
      
    puts "hash"
    puts hash
      
    hash["hashed_url"] = salt
    @image = Image.create(hash)
    # hash = @image.id + 1009876
    # @image.update_attributes(:hashed_url => hash)
    
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end
  
  def go
    puts "GOT HERE BITCH"
    hashed_url = params[:hashed_url]
    @image = Image.find_by_hashed_url(hashed_url)
  end
  
end
