class PaysController < ApplicationController
  def list
    @listepays = Pays.all
  end

  def edit
    @pays = Pays.find(params[:id])
  end

  def create
    @new_pays = Pays.create MAR_PAYS_LIB_TX: params[:MAR_PAYS_LIB_TX]
    if @new_pays.errors
      # render :list
      redirect_to "/refdatabo/pays/"
    else
      redirect_to "/refdatabo/pays/"
    end
  end

  def update
    @pays = Pays.find(params[:id])
    if @pays.update MAR_PAYS_LIB_TX: params[:MAR_PAYS_LIB_TX]
      redirect_to "/refdatabo/pays/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    Pays.find(params[:id]).destroy
    redirect_to "/refdatabo/pays/"
  end
end
