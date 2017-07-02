class ItemsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json

  def index
  @items       = Item.all.order("device_name DESC")
  @properties  = Property.all
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
    @search = Item.search(params[:search]).order("device_name DESC")
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @item        = Item.new
    @properties  = Property.all
    @departments = Department.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item        = Item.find(params[:id])
    @properties  = Property.all
    @departments = Department.all
  end

  def create
    @item        = Item.new(params[:item])
    @properties  = Property.all
    @departments = Department.all
    if Item.exists?(serial_number: @item.serial_number) #match on Serial Number
      respond_to do |format|
        #Right now these just create notices at the top of the inventory page, would like to make it so it reloads form with other data filled in and failed box highlited. Added to TODO
        #format.html { redirect_to @item, alert: 'Items could not be created as Serial Number already exists'}
        flash.now[:alert] = 'Items could not be created as Serial Number already exists!'
        format.html { render action: 'new'}
      end
    elsif Item.exists?(device_name: @item.device_name) #match on Device Name
      respond_to do |format|
        #format.html { redirect_to @item, notice: 'Item could not be created as Device Name already exists'}
        flash.now[:alert] = 'Item could not be created as Device Name already exists!'
        format.html { render action: 'new'}
      end
    else #If a match on SN or name is not found
      respond_to do |format|
        if @item.save
          format.html { redirect_to @item, notice: 'Item was successfully created.' }
          format.json { render json: @item, status: :created, location: @item }
        else
          respond_with(@items)
        end
      end
    end
  end

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
