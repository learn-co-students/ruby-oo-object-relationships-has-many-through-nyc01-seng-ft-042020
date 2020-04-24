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

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|food| food.customer == self}
    end


    def waiters
        meals = Meal.all.select { |meal| meal.customer == self }
        meals.map {|meal| meal.waiter}
    end
end