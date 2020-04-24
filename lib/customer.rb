class Customer
  attr_accessor :name, :age

  @@all = [] 

  # # ^^ class variable that stores every 
  #`customer` instance upon initialization.

  def initialize(name,age)
    @name = name
    @age = age
    Customer.all << self 
  end

  def self.all
    @@all
  end

def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
#notice that we are not using a customer
# parameter when setting up new_mean. 
#its because we are the customer.
# so we only need to use self. 
end

def meals 
    Meal.all.select do |meal|
        meal.customer == self
    end
end

def waiters
    meals.map.do |meal|
    meal.waiter
end
end
# ^^ we are using the meals method
# we just built, to loop over the 
# array of meals that are linked to this 
# particular customer. and return the waiters
# associated w them
end 

