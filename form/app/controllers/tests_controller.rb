class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def create
    @test = Test.create(params.require(:test).permit(:name, :email, :dob))

    if @test.save
      redirect_to tests_path
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    @test = Test.update_attributes(params.require(:test).permit(:name, :email, :dob))

    if @test.save
      redirect_to tests_path
    else
      render 'edit'
    end
  end

  def show
    @test = Test.find(params[:id])
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path
  end

end
