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

    def menu
        menu_items = {}
        dishes.each do |dish|
            if menu_items.key?(dish.category) == true
                (menu_items[dish.category] ||= []) << dish.name
            else
              menu_items[dish.category] = [dish.name]
            end
        end

        menu_items.each {|key, value| menu_items[key] = value.sort}
        plural_keys ={:appetizer => :appetizers, :entre => :entres, :dessert => :desserts}
        plural_keys.values.zip(menu_items.values_at(*plural_keys.keys)).to_h

    end  
            
end