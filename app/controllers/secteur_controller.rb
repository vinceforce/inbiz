class SecteurController < ApplicationController
  def list
    @listesecteurs = Secteur.all
  end

  def edit
    @secteur = Secteur.find(params[:id])
  end

  def create
    @new_secteur = Secteur.create mar_sec_lib_tx: params[:mar_sec_lib_tx]
    if @new_secteur.errors
      # render :list
      redirect_to "/refdatabo/secteurs/"
    else
      redirect_to "/refdatabo/secteurs/"
    end
  end

  def update
    @secteur = Secteur.find(params[:id])
    if @secteur.update mar_sec_lib_tx: params[:mar_sec_lib_tx]
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
