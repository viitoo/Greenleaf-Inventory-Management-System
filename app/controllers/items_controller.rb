class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json
  # GET /items
  # GET /items.json
  def index
	@properties = Property.all
	@departments = Department.where("property_id = ?", Property.first.id)
	if params[:search]
		redirect_to items_results_path
	else
		@search = Item.none
	end
  end

  def update_departments
	  @departments = Department.where("property_id = ?",params[:property_id])
	  respond_to do |format|
	  	format.html #update_departments.html.erb
		format.js
	  end
  end

  def results
	  @search = Item.search(params[:search]).order("created_at DESC")
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @properties = Property.all
    @departments= Department.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @properties = Property.all
    @departments= Department.all
  end

  # POST /items
  # POST /items.json
  def create
	  @item = Item.new(params[:item])
	  @properties = Property.all
	  @departments= Department.all
	  if Item.exists?(:serial_number=> @item.serial_number) #match on Serial Number
		  respond_to do |format|
			  #Right now these just create notices at the top of the inventory page, would like to make it so it reloads form with other data filled in and failed box highlited. Added to TODO
			  #format.html { redirect_to @item, alert: 'Items could not be created as Serial Number already exists'}
			  flash.now[:alert] = 'Items could not be created as Serial Number already exists!'
			  format.html { render :action => 'new'}

		  end
	  elsif Item.exists?(:device_name=> @item.device_name) #match on Device Name
		  respond_to do |format|
                          #format.html { redirect_to @item, notice: 'Item could not be created as Device Name already exists'}
			   flash.now[:alert] = 'Item could not be created as Device Name already exists!'
                          format.html { render :action => 'new'}
                  end
	  else #If a match on SN or name is not found
	  	  respond_to do |format|
			  if @item.save
				  format.html { redirect_to @item, notice: 'Item was successfully created.' }
				  format.json { render json: @item, status: :created, location: @item }
	  		  else
				  respond_with(@items)
	  		  end
	  	  end #End Respond to
      	  end #End If for SN & Name
  end #end create

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        respond_with(@items)
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def import
	  Item.import(params[:file])
	  redirect_to items_path, notice: "Items from CSV added successfully"
  end
  
  def csv
  end
end
