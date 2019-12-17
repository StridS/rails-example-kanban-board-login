class ApplicationController < ActionController::Base
  before_action :count_requests
 
  def count_requests
    session[:counter] = 0 if session[:counter].nil?
    session[:counter] += 1
  end  
end
