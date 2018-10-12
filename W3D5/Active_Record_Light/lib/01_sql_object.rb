require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns unless @columns.nil?
    @columns = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    .map {|name| name.to_sym}
  end

  def self.finalize!
    self.columns.each do |column|
      # str_get = "@" + column.to_s
      str_set = column.to_s + "="

      define_method(column) {attributes[column]}
      define_method(str_set) {|value| attributes[column] = value}
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ? @table_name : self.name.split(/<=[A-Z]/).join("_").downcase + "s"
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL,id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
    SQL
    self.parse_all(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |key,value|
      attr_name = key.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      self.send("#{key}=",value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.class.columns.map {|column| self.send(column)}
  end

  def insert
    # ...
    col_names = self.class.columns.join(",")
    n = self.class.columns.count
    question_marks = (["?"] * n).join(",")

    DBConnection.execute(<<-SQL,*attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set_line = self.class.columns.map{|attr_name| "#{attr_name} = ?"}.join(", ")

    DBConnection.execute(<<-SQL,*attribute_values,self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
    if id.nil?
      insert
    else
      update
    end
  end
end
