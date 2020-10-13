class SuperherosController < ApplicationController
    def index
        superheroes = Superhero.all
        render json: superheroes
    end
    
    
end
