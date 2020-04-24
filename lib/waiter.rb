require 'pry'
class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|person| person.waiter == self}
    end


    def best_tipper
        best_tip = 0
        meals.each do |order|
            if order.tip > best_tip
                best_tip = order.tip
            end
        end
        order = meals.find {|order| order.tip == best_tip}
        order.customer 
    end



end