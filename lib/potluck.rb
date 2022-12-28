require './dish'

class Potluck
    attr_reader :date
    attr_accessor :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(new_dish)
        dishes << new_dish
    end

    def get_all_from_category(input)
        category_list = []
        dishes.each do |dish|
            if dish.category == input
                category_list << dish
            end  
        end
        category_list
    end
            
end