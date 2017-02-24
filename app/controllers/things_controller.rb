class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  def index
    # @ta = ActsAsTaggableOn::Tag.all.pluck(:name)
    respond_to do |format|
      format.html
      format.json {
        render json: objects_with_tags
      }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {
        render json: object_with_tags
      }
    end
  end

  def new
    @thing = Thing.new
    respond_to do |format|
      format.html
      format.json {
        render json: @thing
      }
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json {
        render json: object_with_tags
      }
    end
  end

  def create
    @thing = Thing.new thing_params
    if @thing.save
      render json: {thing: @thing, msg: t('.success'), redirect_to: "things_path"}
    else
      render json: {errors: @thing.errors, msg: @thing.errors.full_messages.join(', ')}, status: 422
    end
  end

  def update
    if @thing.update(thing_params)
      render json: {thing: @thing, msg: t('.success'), redirect_to: "things_path"}
    else
      render json: {errors: @thing.errors, msg: @thing.errors.full_messages.join(', ')}, status: 422
    end
  end

  def destroy
    @thing.destroy
    render json: {msg: t('.success'), redirect_to: "things_path"}
  end

  private

  def object_with_tags
    thing = @thing.attributes
    thing[:tag_list] = @thing.tag_list
    return thing
  end
  
  def objects_with_tags
    all = []
    Thing.all.each do |object|
      object_attributes = object.attributes
      object_attributes[:tag_list] = object.tag_list
      all << object_attributes 
    end
    return all
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

  def thing_params
    params.require(:thing).permit(:title, :description, 
                                  :address, :tag_list,
                                  :category)
  end
end
