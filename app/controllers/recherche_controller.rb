class RechercheController < ApplicationController
  def autocomplete
    @marques = Marque.all
    @contacts = Contact.all
    @term = params[:term].split(",").last.strip
    # @marques_filtered = @marques.where("mar_marques_nom_tx LIKE ?", "%#{params[:term]}%")
    if @term == ""
      @marques_filtered = []
    else
      @marques_filtered = @marques.where("mar_marques_nom_tx LIKE ?", "%#{@term}%")
    end
    @arrayterms_for_autocomplete = []
    @marques_filtered.each do |m|
      @arrayterms_for_autocomplete.push(m.mar_marques_nom_tx)
    end
    if @term == ""
      @contacts_filtered = []
    else
      @contacts_filtered = @contacts.where("cont_contacts_comp_metiers_tx LIKE ? OR cont_contacts_nom_tx LIKE ?", "%#{@term}%", "%#{@term}%")
    end
    @contacts_filtered.each do |c|
      @metiers = c.cont_contacts_comp_metiers_tx.split(",")
      @nom = c.cont_contacts_nom_tx
      if @nom.include? @term
        @arrayterms_for_autocomplete.push(@nom)
      end
      @metiers.each do |m|
        if m.include? @term
          @arrayterms_for_autocomplete.push(m)
        end
      end
    end
    @arrayterms_for_autocomplete.sort!
    @terms_for_autocomplete = []
    @arrayterms_for_autocomplete.each do |a|
      @terms_for_autocomplete.push({label: a, value: a})
    end
    # @terms_for_autocomplete.sort!

    respond_to do |format|
      format.html
      format.json {
        render json: @terms_for_autocomplete
      }
    end
  end
  def results
    @queries = params[:query].split(",")
    @queries.each do |q|
      q.strip!
      if q==""
        @queries.delete(q)
      end
    end
    @marques = Marque.where(mar_marques_nom_tx: @queries)
    @where_cond = ""
    @queries_like = []
    @firstIteration = true
    @queries.each do |q|
      if !@firstIteration
        @where_cond = @where_cond + " OR "
      end
      @firstIteration = false
      @where_cond = @where_cond + "cont_contacts_comp_metiers_tx LIKE '%#{q}%'"
    end
    @queries.each do |q|
      if !@firstIteration
        @where_cond = @where_cond + " OR "
      end
      @where_cond = @where_cond + "cont_contacts_nom_tx = '#{q}'"
    end
    @contacts = Contact.where(@where_cond)
    @liensContact = LiensContactMarque.all
  end
end
