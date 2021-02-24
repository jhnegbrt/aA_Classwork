require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    arr = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM cats
    SQL
    arr2 = arr[0].map {|ele| ele.to_sym}
    arr2
    @columns = arr2
    
  end

  def self.finalize!

    @columns.each do |col|
      define_method(col) {instance_variable_get("#{col}")}
      define_method("#{col}=") {|value| instance_variable_set("#{col}", value)}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})

    params.each do |k, v|
      sym = k.to_sym
      raise_error unless @attributes.include?(sym)

      
    end
    

  end

  def attributes
    @attributes ||= {}

  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
