class UsersController < ApplicationController 

def index
end 

def show  
end

def logout
	session.clear
	redirect_to("/")
end



end
