class Meal
    attr_accessor :waiter, :customer, :total, :tip # give it macros of the other classes. This allows the customer and waiter instances
                                                    # to get all the info they need about the meal w/o storing it themselves
    @@all = []
   
    def initialize(waiter, customer, total, tip=0) # give it the arguments of the customer and waiter classes
      @waiter = waiter
      @customer = customer
      @total = total
      @tip = tip
      @@all << self
    end
   
    def self.all
      @@all
    end
end

# The way we're going to structure this relationship is by setting 
# up our Meal class as a 'joining' model between our Waiter and our Customer classes. 
# And because we're obeying the single source of truth, we're going to tell the Meal 
# class to know all the details of each meal instance. That includes not only the total 
# cost and the tip (which defaults to 0) but also who the customer and waiter were for each meal.

# In the Meal class code above, both the customer and waiter instances have the ability to get all the information about the meal 
# that they need without having to store it themselves. Let's build some methods.