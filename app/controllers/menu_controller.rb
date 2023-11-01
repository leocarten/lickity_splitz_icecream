class MenuController < ApplicationController
    def login
        
    end

    def show
        session[:customer]
        @food = Food.find(params[:id])
    end

    def orderingMenu
        postedElements = "0"
        @lunchAndDinnerMenu = Food.where(breakfastOrDinner: "0")
        @breakfastMenu = Food.where(breakfastOrDinner: "1")
        #This will change true or false depending if breakfast or lunch was clicked
        @isBreakfastMenu = postedElements == "1"
        puts @isBreakfastMenu
    end

    def confirmation
        session[:customer] = Customer.find_by(first_name: session[:firstName],phone_number: session[:phoneNumber])
        puts "------------------------------------------"
        puts session[:customer]
        puts "------------------------------------------"
        @customers_temp_orders = TempOrder.where(customer_id: session[:customer].id)
        puts @customers_temp_orders
    end

    def order
        @temp_order = TempOrder.new
        @temp_orders = TempOrder.all

        @foods = Food.all
        session[:customer] = Customer.find_by(first_name: session[:firstName],phone_number: session[:phoneNumber])
        @customers_temp_orders = TempOrder.where(customer_id: session[:customer].id)
    end
end
