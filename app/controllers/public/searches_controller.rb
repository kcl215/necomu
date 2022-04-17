class Public::SearchesController < ApplicationController

    def search
    @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(20)
    end

end


