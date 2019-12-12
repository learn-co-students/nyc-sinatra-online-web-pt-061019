class FiguresController < ApplicationController

  get '/figures' do
  @figures = Figure.all
  erb :'/figures/index'
  end

  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @landmark.update(params[:landmark])
    redirect to "/figures/#{@figure.id}"
  end

end
