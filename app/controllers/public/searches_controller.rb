class Public::SearchesController < ApplicationController
    def search
    @customers = Customer.looks(params[:search], params[:word])
    end
end


