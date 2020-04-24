require "pry"
class Waiter
    attr_accessor :name, :year_of_exp
    @@all = []
    
    def initialize (name, year)
        @name = name
        @year_of_exp = year
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        # a=self.meals.map do |meal|
        #     meal.tip
        # end
        # b=a.max
        # c=self.meals.find do |meal|
        #     meal.tip == b
        # end
        # c.customer

        c = self.meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end

        c.customer
    end
end