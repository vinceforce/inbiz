class PaysController < ApplicationController
  def list
    @listepays = Pays.all
  end

  def edit
    @pays = Pays.find(params[:id])
  end

  def create
    @new_pays = Pays.create mar_pays_lib_tx: params[:mar_pays_lib_tx]
    if @new_pays.errors
      # render :list
      redirect_to "/refdatabo/pays/"
    else
      redirect_to "/refdatabo/pays/"
    end
  end

  def update
    @pays = Pays.find(params[:id])
    if @pays.update mar_pays_lib_tx: params[:mar_pays_lib_tx]
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
