class SecteurController < ApplicationController
  def list
    @listesecteurs = Secteur.all
  end

  def edit
    @secteur = Secteur.find(params[:id])
  end

  def create
    @new_secteur = Secteur.create MAR_SEC_LIB_TX: params[:MAR_SEC_LIB_TX]
    if @new_secteur.errors
      # render :list
      redirect_to "/refdatabo/secteurs/"
    else
      redirect_to "/refdatabo/secteurs/"
    end
  end

  def update
    @secteur = Secteur.find(params[:id])
    if @secteur.update MAR_SEC_LIB_TX: params[:MAR_SEC_LIB_TX]
      redirect_to "/refdatabo/secteurs/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    Secteur.find(params[:id]).destroy
    redirect_to "/refdatabo/secteurs/"
  end
end
