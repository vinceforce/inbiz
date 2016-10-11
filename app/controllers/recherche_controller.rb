class RechercheController < ApplicationController
  def autocomplete
    @marques = Marque.all
    @marques_filtered = @marques.where("mar_marques_nom_tx LIKE ?", "%#{params[:term]}%")
    @marques_for_autocomplete = []
    @marques_filtered.each do |m|
      @marques_for_autocomplete.push({label: m.mar_marques_nom_tx, value: m.mar_marques_nom_tx})
    end
    respond_to do |format|
      format.html
      format.json {
        render json: @marques_for_autocomplete
      }
    end
  end
  def results
    # @marques = Marque.where("mar_marques_nom_tx LIKE ?", "%#{params[:query]}%")
    @marques = Marque.where("mar_marques_nom_tx = ?", "#{params[:query]}")
    @liensContact = LiensContactMarque.all
    @contacts = Contact.all
  end
end
