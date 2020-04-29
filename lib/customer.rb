class Customer
    attr_accessor :name, :age #because we created an attribute accessor for name and age, 
                            # the customer can change their name or age. 
    @@all = []  # this is a class variable that tracks every instance of a customer upon creation.
   
    def initialize(name, age) # each customer is created with these attributes
      @name = name #attribute
      @age = age #attribute
      @@all << self #attribute  this fills the class variable array with all indiviual instances of Customer
    end
   
    def self.all #class method that represents entire Customer class
      @@all
    end

    def new_meal(waiter, total, tip=0) # here we give the customer the ability to create a meal
        Meal.new(waiter, self, total, tip) #To do this, they'll need to take 
        # in an instance of a waiter and supply the total and tip, which we'll have defaulted 
        # to 0 here as well.
      end

      # Notice that the parameters are different for the new_meal method are different for customer and 
# waiter, but the order of arguments for Meal.new() remains the same - a waiter, a customer, 
# a total and a tip.

    def meals ## In plain English, the customer is going to look at all of the meals, and then select only the ones that belong 
      Meal.all.select do |meal|  # to them. So then create a meals instance method.
        meal.customer == self  # We're iterating through every instance of Meal and returning only the 
        # ones where the meal's customer matches the current customer instance.
      end
    end

    def waiters #Since we already have a #meals method to get an array of meals, we can reuse it here and write a #waiters method 
        meals.map do |meal|
          meal.waiter
        end
      end
   
  end

#   A customer has many meals, and a customer has many waiters through those meals. 
#   Similarly, a waiter has many meals and has many customers through meals.

#   #NOTES: 
#   We want to make sure when building out classes, that there's something 
#   to store each instance. That is to say: the Customer class should know 
#   about every customer instance that gets created.

# As you can see, each customer instance has a name and an age. Their name and 
# age are set upon initialization, and because we created an attribute accessor 
# for both, the customer can change their name or age. If we wanted to limit 
# this ability to read-only, we would create an attribute reader instead. 
# The Customer class also has a class variable that tracks every instance of 
# customer upon creation.

# So it goes without saying that a customer can have many meals.
# So it could be said that your relationship with the waiter is 
# through your meal. The same could be said of the waiter's 
# relationship with each customer.

# After building out the Meal class with the initialize method and the class method, do the following:

# Now you need to build up the relationship:
# If you take a look at our customer right now, they aren't capable of doing much. Let's 
# change that and give them the ability to create a meal. To do this, they'll need to take 
# in an instance of a waiter and supply the total and tip, which we'll have defaulted 
# to 0 here as well.

# Create new_meal method in Customer and Waiter class

# As you can see, we don't need to take customer in as an argument, because we're passing in 
# self as a reference to the current instance of customer. This method will allow us to create 
# new meals as a customer, and automatically associate each new meal with the customer that created 
# it. We can do the same thing for the Waiter class.

# Notice that the parameters are different for the new_meal method are different for customer and 
# waiter, but the order of arguments for Meal.new() remains the same - a waiter, a customer, a total 
# and a tip.

# Now you can create your instances:
# sam = Customer.new("Sam", 27)
# pat = Waiter.new("Pat", 2)
# alex = Waiter.new("Alex", 5)

# sam.new_meal(pat, 50, 10) # A Customer creates a Meal, passing in a Waiter instance
# sam.new_meal(alex, 20, 3) # A Customer creates a Meal, passing in a Waiter instance
# pat.new_meal(sam, 30, 5) # A Waiter creates a Meal, passing in a Customer instance

# To complete our goal of establishing a has-many-through relationship, we need a way for our customer 
# and waiter instances to get information about each other. The only way they can get that information is 
# through the meals they've created.

# # Relating this to real life, we can imagine a situation where a waiter might want to know who their regular 
# customers are and what meals those customers usually order. Or, a customer might want to know the name of the 
# waiter of their last meal so they can leave a good review. To get our waiters and customers this information, 
# we're going to consult the Meal class from the Customer and Waiter classes. Let's start with the Customer class.

# In plain English, the customer is going to look at all of the meals, and then select only the ones that belong 
# to them. 

# Create meals instance method
# So then create a meals instance method and then do the same in the Waiter class, but change the variable. 

# We're iterating through every instance of Meal and returning only the 
# # ones where the meal's customer matches the current customer instance.

# If a customer, Rachel, wants to know about all of her meals, all we need to do is call the #meals method on 
# the her Customer instance.

#     alex = Customer.new("Alex", 30)
#     rachel = Customer.new("Rachel", 27)
#     dan = Waiter.new("Dan", 3)
     
#     rachel.new_meal(dan, 50, 10)
#     alex.new_meal(dan, 30, 5)
     
#     rachel.meals #=> [#<Meal:0x00007fa23f1575a0 @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>, @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]
#     rachel.meals.length #=> 1
     
#     Meal.all.length #=> 2


# Above, two meals were created, one for rachel and one for alex, both with the same waiter. However, running 
# rachel.meals only returns the meal rachel is associated with.

# So rachel.meals will return an array of all of Rachel's meals, but what if we now want a list of all of the 
# waiters that Rachel has interacted with? Each meal is also associated with a waiter, so to get every waiter 
# from every meal Rachel has had, we need to take the array of all of Rachel's meals, map over it, getting the 
# waiter from each of those meals.

# Write a waiters method 
# Since we already have a #meals method to get an array of meals, we can reuse it here and write a #waiters method 

# terrance = Customer.new("Terrance", 27)
# jason = Waiter.new("Jason", 4)
# andrew = Waiter.new("Andrew", 7)
# yomi = Waiter.new("Yomi", 10)
 
# terrance.new_meal(jason, 50, 6)
# terrance.new_meal(andrew, 60, 8)
# terrance.new_meal(yomi, 30, 4)
 
# terrance.waiters #=> [#<Waiter:0x00007fa23f18f860 @name="Jason", @yrs_experience=34>, #<Waiter:0x00007fa23f196818 @name="Andrew", @yrs_experience=27>, #<Waiter:0x00007fa23f19dd20 @name="Yomi", @yrs_experience=20>] 
# terrance.waiters.length #=> 3

# To reinforce this concept, let's look at the same sort of relationship, but in the other direction. This time, 
# we will build out methods so a waiter can find the customer that tips the the best.

# Again to start, just like the customer, the waiter needs a way to get all the meals they have served. 
# We'll create a #meals method again, with a subtle change:

# ./lib/waiter.rb
 
# def meals
#   Meal.all.select do |meal|
#     meal.waiter == self #checking for waiter now
#   end
# end

# To find the best tipper, we can write another method, #best_tipper, use the array we get from #meals, then 
# return the customer of the meal with the highest tip:

# ./lib/waiter.rb
 
# def best_tipper
#   best_tipped_meal = meals.max do |meal_a, meal_b|
#     meal_a.tip <=> meal_b.tip
#   end
 
#   best_tipped_meal.customer
# end

# Now write your Waiter and Customer instances to test if the relationship is made:

# jason = Waiter.new("Jason", 4)
# lisa = Customer.new("Lisa", 24)
# tim = Customer.new("Tim", 35)
# terrance = Customer.new("Terrance", 27)
 
# terrance.new_meal(jason, 50, 3)
# lisa.new_meal(jason, 40, 10)
# tim.new_meal(jason, 45, 8)
 
# jason.best_tipper #=> #<Customer:0x00007f80829959a8 @name="Lisa", @age=24>
# jason.best_tipper.name #=> "Lisa"
# And there you have it - customers have access to waiters, and waiters have access to customers. Notice as well that neither the Customer class, nor the Waiter class needed additional attributes - they don't need to keep track of this information; they only need to have the methods that ask the write questions - in this case to the Meal class, the join between customer and waiter.