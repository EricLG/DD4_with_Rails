class ObjectsController < ApplicationController
  def index
  end


  def index_objets_commun
    @communs = ObjetCommun.all
  end


  def new_objet_commun
    
  end

  def create_objet_commun

  end

  def delete_objet_commun

  end
end
