class RechercheController < ApplicationController
  def autocomplete
    @marques = Marque.all
    @contacts = Contact.all
    @term_brut = params[:term].split(",").last.strip
    @term = @term_brut.mb_chars.downcase.strip.normalize
    # @marques_filtered = @marques.where("mar_marques_nom_tx LIKE ?", "%#{params[:term]}%")
    if @term == ""
      @marques_filtered = []
    else
      @marques_filtered = @marques.where("unaccent(lower(mar_marques_nom_tx)) LIKE ?", "#{@term}%")
    end
    @arrayterms_for_autocomplete = []
    @marques_filtered.each do |m|
      @arrayterms_for_autocomplete.push(m.mar_marques_nom_tx)
    end
    if @term == ""
      @contacts_filtered = []
    else
      @contacts_filtered = @contacts.where("unaccent(lower(cont_contacts_comp_metiers_tx)) LIKE ? OR unaccent(lower(cont_contacts_nom_tx)) LIKE ?", "#{@term}%", "#{@term}%")
    end
    @contacts_filtered.each do |c|
      @metiers = c.cont_contacts_comp_metiers_tx ? c.cont_contacts_comp_metiers_tx.split(",") : []
      @nom = c.cont_contacts_nom_tx
      if @nom.mb_chars.downcase.strip.normalize.include? @term
        @arrayterms_for_autocomplete.push(@nom)
      end
      @metiers.each do |m|
        if m.mb_chars.downcase.strip.normalize.include? @term
          @arrayterms_for_autocomplete.push(m)
        end
      end
    end
    @arrayterms_for_autocomplete = @arrayterms_for_autocomplete.uniq
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
    @contactsDB = Contact.where(@where_cond)
    @contacts = []
    @contactsDB.each do |c|
      @lc = LiensContactMarque.find_by(cont_contacts_ident_nm: c.cont_contacts_ident_nm)
      @con = c.attributes
      if @lc
        @con["mar_marques_ident_nm"] = @lc["mar_marques_ident_nm"]
        @con["mar_cont_type_tx"] = @lc["mar_cont_type_tx"]
        @con["mar_cont_design_bl"] = @lc["mar_cont_design_bl"]
        @con["mar_cont_marketing_bl"] = @lc["mar_cont_marketing_bl"]
        @con["mar_cont_communication_bl"] = @lc["mar_cont_communication_bl"]
        @con["mar_cont_event_bl"] = @lc["mar_cont_event_bl"]
        @con["mar_cont_digital_bl"] = @lc["mar_cont_digital_bl"]
      end
      @contacts.push(@con)
    end
    @liensContact = LiensContactMarque.all
    # @nb_results = @marques.size + @contacts.size
    @toutes_les_marques = Marque.all
    @statuts = Statut.all.order("mar_sta_lib_tx")
    @types = Type.all.order("mar_typ_lib_tx")
    @secteurs = Secteur.all.order("mar_sec_lib_tx")
    @pays = Pays.all.order("mar_pays_lib_tx")

  end
end
