class CatsController < ApplicationController

    def index

        # list all the cats
            # add some cats to the db
            # write real index functionality

        # give link to their show pages
        # actually make a view, embedded rb file
        # have it insert all the cat info from each cat 
        # in teh right place in the HTML
        # correctly generate a dynamic link to each cat's show page
        # 1  .... /cats/1    "/cats/" + id.to_s

        @cats = Cat.all
        render :index #  = activate views/cats/index.html.erb
 
        # render json: Cat.all 
        # render :index
        
    end

end
