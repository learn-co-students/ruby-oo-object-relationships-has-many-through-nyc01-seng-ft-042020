class Meal
    attr_accessor :waiter, :customer
    @@all = []
    def initialize (waiter, customer, total, tip)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        Meal.all << self
    end
    def self.all
        @@all
    end
end