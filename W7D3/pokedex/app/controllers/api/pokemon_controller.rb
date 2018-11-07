class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @items = Item.where(pokemon_id: @pokemon.id)
    render :show
  end
end
