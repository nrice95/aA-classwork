require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    self.class_name.to_s.capitalize.constantize
  end

  def table_name
    # ...
    self.class_name.split(/<=[A-Z]/).join("_").downcase + "s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
    @foreign_key = "#{name}_id".to_sym
    @primary_key = :id
    @class_name = name.capitalize

    # options[:foreign_key].nil? ? @foreign_key = "#{name}_id".to_sym : @foreign_key = options[:foreign_key]
    @foreign_key = options[:foreign_key] unless options[:foreign_key].nil?
    @primary_key = options[:primary_key] unless options[:primary_key].nil?
    @class_name = options[:class_name] unless options[:class_name].nil?
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    @foreign_key = "#{self_class_name.downcase}_id".to_sym
    @primary_key = :id
    @class_name = name.capitalize[0...-1]

    # options[:foreign_key].nil? ? @foreign_key = "#{name}_id".to_sym : @foreign_key = options[:foreign_key]
    @foreign_key = options[:foreign_key] unless options[:foreign_key].nil?
    @primary_key = options[:primary_key] unless options[:primary_key].nil?
    @class_name = options[:class_name] unless options[:class_name].nil?
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    define_method(name) do
      result = BelongsToOptions.new(name,options)
      foreign_key_val = self.send(result.foreign_key)

      result
        .model_class
        .where(id: foreign_key_val)
        .first
    end
  end

  def has_many(name, options = {})
    # ...
    define_method(name) do
      result = HasManyOptions.new(name,self.class.class_name,options)
      foreign_key_val = self.send(result.foreign_key)

      result
        .model_class
        .where(id: foreign_key_val)
        .first
    end
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
