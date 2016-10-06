class StatutController < ApplicationController
  def list
    @listestatuts = Statut.all
  end

  def edit
    @statut = Statut.find(params[:id])
  end

  def create
    @new_statut = Statut.create MAR_STA_LIB_TX: params[:MAR_STA_LIB_TX]
    if @new_statut.errors
      # render :list
      redirect_to "/refdatabo/statuts/"
    else
      redirect_to "/refdatabo/statuts/"
    end
  end

  def update
    @statut = Statut.find(params[:id])
    if @statut.update MAR_STA_LIB_TX: params[:MAR_STA_LIB_TX]
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
