class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end
  
    def self.all 
        @@all 
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
    # returns an array of Meal instances associated with this customer 
        Meal.all.select do |x|
            x.customer == self 
        end
    end

    def waiters  
    # returns an array of Waiter instances associated with this customer's meals 
        meals.map do |x|
            x.waiter 
        end  
    end


    
end