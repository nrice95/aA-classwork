class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...

    names.each do |name|
      str_get = "@" + name.to_s
      str_set = name.to_s + "="

      define_method(name) {instance_variable_get(str_get)}

      define_method(str_set) {|value| instance_variable_set(str_get,value)}
    end
  end

end
