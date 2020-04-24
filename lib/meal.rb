class Meal
    @@all=[]
    attr_accessor :waiter, :customer, :total, :tip

    def initialize(waiter,customer,total,tip=0)
        @waiter=waiter
        @customer=customer
        @total=total
        @tip=tip
        @@all << self
    end


    def self.all
        @@all
    end

    def meals
        Meal.all.select do |meal|
            meals.customer == self
        end
    end
    

end