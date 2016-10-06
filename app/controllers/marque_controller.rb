class MarqueController < ApplicationController
  def show
  end

  def create
  end

  def list
    @marques = Marque.all
    @liensContact = LiensContactMarque.all
    @contacts = Contact.all
  end
end
