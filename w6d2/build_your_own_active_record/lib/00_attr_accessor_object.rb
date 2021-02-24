class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
        instance_variable_get("@#{name}")
      end

      define_method("#{name}=") do |value| 
        instance_variable_set("@#{name}", value)
      end
    end
  end
end

#what does an accessor do?
#takes in an instance variable as a symbol
#creates a method that allows you to set that variable
#creates a method that allows you to get that variable
#attr_accessor :lunch
#def lunch
#   @lunch
# end

# def lunch = (lunch)
#   @lunch = lunch
# end
