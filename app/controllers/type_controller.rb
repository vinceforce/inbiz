class TypeController < ApplicationController
  def list
    @listetypes = Type.all
  end

  def edit
    @type = Type.find(params[:id])
  end

  def create
    @new_type = Type.create MAR_TYP_LIB_TX: params[:MAR_TYP_LIB_TX]
    if @new_type.errors
      # render :error
      redirect_to "/refdatabo/types/"
    else
      redirect_to "/refdatabo/types/"
    end
  end

  def update
    @type = Type.find(params[:id])
    if @type.update MAR_TYP_LIB_TX: params[:MAR_TYP_LIB_TX]
      redirect_to "/refdatabo/types/#{params[:id]}"
    else
      render :edit
    end
  end

  def destroy
    Type.find(params[:id]).destroy
    redirect_to "/refdatabo/types/"
  end
end
