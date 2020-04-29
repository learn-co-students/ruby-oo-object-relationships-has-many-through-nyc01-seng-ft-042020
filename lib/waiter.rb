class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = [] # this is class variable that stores every waiter instance upon initialization
   
    def initialize(name, yrs_experience) #each waiter is created with these attributes
      @name = name #attribute
      @yrs_experience = yrs_experience #attribute
      @@all << self  #this fills the class variable array with all indiviual instances of Waiter
    end
   
    def self.all #class method that represents the entire Waiter class
      @@all
    end

    def new_meal(customer, total, tip=0) #after defining a new_meal method in the customer class, you then create it in the waiter class.
        Meal.new(self, customer, total, tip)
      end
# Notice that the parameters are different for the new_meal method are different for customer and 
# waiter, but the order of arguments for Meal.new() remains the same - a waiter, a customer, 
# a total and a tip.

    def meals
      Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
      end
    end
    # We're iterating through every instance of Meal and returning only the 
    # ones where the meal's waiter matches the current waiter instance.


    # To reinforce this concept, let's look at the same sort of relationship, but in the other direction. This time, 
# we will build out methods so a waiter can find the customer that tips the the best.

# Again to start, just like the customer, the waiter needs a way to get all the meals they have served. 
# We'll create a #meals method again, with a subtle change:

    def meals
        Meal.all.select do |meal|
          meal.waiter == self #checking for waiter now
        end
      end

      # To find the best tipper, we can write another method, #best_tipper, use the array we get from #meals, 
      # then return the customer of the meal with the highest tip:

      def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end
   
  end

#   Each instance of the Waiter class has a name and an attribute describing their years 
#   of experience. Just like the Customer class, the Waiter class has a class variable 
#   that stores every waiter instance upon initialization.

#   after defining a new_meal method in the customer class, you then create it in the waiter class.



