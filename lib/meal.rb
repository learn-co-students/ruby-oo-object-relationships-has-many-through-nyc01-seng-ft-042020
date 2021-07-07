class Meal
attr_accessor :waiter, :customer, :total, :tip
# has access to customers, waiters, total and tip
#adding accessores for these instances allow
#to read and edit them.

@@all = []
#class method to store
#every instance of a meal.

def initialize(waiter, customer, total, tip =0)
@waiter = waiter
@customer = customer
@total = total
@tip = tip 
Meal.all << self 
end 

def self.all
    @@all
end
#allows us to return an array of 
#all the instances of a meal.




end