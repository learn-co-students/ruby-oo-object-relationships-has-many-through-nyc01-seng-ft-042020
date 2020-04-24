class Waiter
    attr_accessor :name, :yrs_experience
    @@all = []
    def initialize(name,years)
        @name = name
        @yrs_experience = years

        Waiter.all<<self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals()
        Meal.all.select do |i|
            i.waiter==self
        end
    end

    def best_tipper
        max= meals[0].tip
        bestTipper = meals[0].customer
        meals.each do |i|
            if(i.tip>max)
                max = i.tip
                bestTipper = i.customer
            end
        end
        bestTipper
    end
end