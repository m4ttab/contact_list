class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
  	if params[:group_id]
      @group = Group.find(params[:group_id])
      @contacts = @group.contacts.order('surname')
    else
      @contacts = Contact.order('surname')
    end
  end

  def new
  	@contact = Contact.new
  end

  def edit
  end

  def create
  	@contact = Contact.new(contact_params)
  		if @contact.save
  			redirect_to @contact, notice: 'Contact was successfully created.'
  		else
  			render :new
  		end
  end

  def update
  	if @contact.update(contact_params)
  		redirect_to @contact, notice: 'Contact was successfully updated'
  	else
  		render :edit 
  	end
	end

  def show
  end

  def destroy
  	@contact.destroy
  		redirect_to contacts_path, notice: 'Contact was successfully destroyed'
  end

  private 

	def set_contact
		@contact = Contact.find(params[:id])
	end

	def contact_params
		params.require(:contact).permit(:name, :surname, :phone, :address, :email, :important, :group_id)
	end


end
