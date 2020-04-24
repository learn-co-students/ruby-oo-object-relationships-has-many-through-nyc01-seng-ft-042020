class Customer
    attr_accessor :name, :age
    @@all = []
  def initialize(name, age)
    @name = name 
    @age = age 
    self.all << self
  end
  def self.all 
    @@all 
  end 
  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end
  def meals
    Meal.all.select {|meal| meal.customer == self}
    #this is iterating over all of the meal instances and 
    #only selecting the meals with a customer THIS customer
  end 
  def waiters
    meals.all.map {|meal| meal.waiter}
    #this is iterating over the above
    #array of all meals the THIS customer has had AND
    #returning a new array of all of the waiters for those meals
  end
end