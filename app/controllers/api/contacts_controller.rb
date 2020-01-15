class Api::ContactsController < ApplicationController

  def first_contact_action
    @contact = Contact.first #hash of contact data
    render "first_contact.json.jb"
  end

  def all_contacts_action
    @contacts = Contact.all #array of contact hashes
    render "all_contacts.json.jb"
  end

end
