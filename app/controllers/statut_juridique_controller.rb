class StatutJuridiqueController < ApplicationController
  def list
    @listestatutsjuridiques = StatutJuridique.all
  end

  def edit
    @statutjuridique = StatutJuridique.find(params[:id])
  end

  def create
    @new_statut_juridique = StatutJuridique.create MAR_STA_JUR_LIB_TX: params[:MAR_STA_JUR_LIB_TX]
    if @new_statut_juridique.errors
      # render :list
      redirect_to "/refdatabo/statuts_juridiques/"
    else
      redirect_to "/refdatabo/statuts_juridiques/"
    end
  end

  def update
    @statutjuridique = StatutJuridique.find(params[:id])
    if @statutjuridique.update MAR_STA_JUR_LIB_TX: params[:MAR_STA_JUR_LIB_TX]
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
