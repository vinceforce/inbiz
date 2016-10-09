class StatutJuridiqueController < ApplicationController
  def list
    @listestatutsjuridiques = StatutJuridique.all
  end

  def edit
    @statutjuridique = StatutJuridique.find(params[:id])
  end

  def create
    @new_statut_juridique = StatutJuridique.create mar_sta_jur_lib_tx: params[:mar_sta_jur_lib_tx]
    if @new_statut_juridique.errors
      # render :list
      redirect_to "/refdatabo/statuts_juridiques/"
    else
      redirect_to "/refdatabo/statuts_juridiques/"
    end
  end

  def update
    @statutjuridique = StatutJuridique.find(params[:id])
    if @statutjuridique.update mar_sta_jur_lib_tx: params[:mar_sta_jur_lib_tx]
      redirect_to "/refdatabo/statuts_juridiques/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    StatutJuridique.find(params[:id]).destroy
    redirect_to "/refdatabo/statuts_juridiques/"
  end
end
