class StatutController < ApplicationController
  def list
    @listestatuts = Statut.all
  end

  def edit
    @statut = Statut.find(params[:id])
  end

  def create
    @new_statut = Statut.create mar_sta_lib_tx: params[:mar_sta_lib_tx]
    if @new_statut.errors
      # render :list
      redirect_to "/refdatabo/statuts/"
    else
      redirect_to "/refdatabo/statuts/"
    end
  end

  def update
    @statut = Statut.find(params[:id])
    if @statut.update mar_sta_lib_tx: params[:mar_sta_lib_tx]
      redirect_to "/refdatabo/statuts/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    Statut.find(params[:id]).destroy
    redirect_to "/refdatabo/statuts/"
  end
end
