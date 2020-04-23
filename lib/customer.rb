class Customer
  @@all = []
  @@waiters = []

  attr_accessor :name, :age

   def initialize(name, age)
    @name = name
    @age = age
    Customer.all << self
   end

    def self.all
      @@all
    end

    def new_meal(waiter, total, tip=0)
      Meal.new(waiter, self, total, tip)
    end

    def meals
      Meal.all.select{|meal| meal.customer == self}
    end

    def waiters
       Meal.all.select{|meal| meal.customer == self}.collect{|m| m.waiter}
     end
end
