class Waiter
  @@all = []
  attr_accessor :name, :yrs_experience

   def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    Waiter.all << self
   end

    def self.all
      @@all
    end

    def meals
      Meal.all.select{|meal| meal.waiter == self}
    end

    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end

    def best_tipper
      Meal.all.select{|meal| meal.waiter == self}.select{|m| m.tip}.max_by{|e| e.tip}.customer
    end
end
