class Api::ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts

    if params[:search]
      @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ? OR middle_name iLIKE ? OR email iLIKE ?", "#{params[:search]}", "#{params[:search]}", "#{params[:search]}", "#{params[:search]}")
    end

    if params[:group]
      group = Group.find_by(name: params[:group])
      @contacts = group.contacts.where(user_id: current_user.id)
    end

    # order by id as a default
    @contacts = @contacts.order(:id) 

    render 'index.json.jb'
  end

  def create
    @contact = Contact.new(
     first_name: params[:first_name],
     middle_name: params[:middle_name],
     last_name: params[:last_name],
     email: params[:email],
     phone_number: params[:phone_number],
     bio: params[:bio],
     latitude: params[:latitude],
     longitude: params[:longitude],
     user_id: current_user.id
    )
    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id]) #hash of contact data
    render 'show.json.jb'
  end

  def update
    @contact = Contact.find(params[:id])

    if params[:address]
      coordinates = Geocoder.coordinates(params[:address])
      @contact.longitude = coordinates[1] || @contact.longitude
      @contact.latitude = coordinates[0] || @contact.latitude
    end
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jb'
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: {message: "Contact successfully destroyed"}
  end

end
