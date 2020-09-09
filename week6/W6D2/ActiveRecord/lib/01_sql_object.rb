require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = db_connection.execte2(<<-SQL).first
    SELECT
      *
    FROM
      #{self.table_name}
    LIMIT
      0
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) db_connection
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      select 
        {table_name}.*
      FROM
        {table_name}
    SQL
    parse_all(results)
  end



  def self.parse_all(results)
      results.map {|result| self.new(result)}
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    parse_all(results).first
  end

  def initialize(params = {})
    results.map {|result| self.new(result)}
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map{ |attr| self.send(attr)}
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(",")
    question_marks = (["?"])
  end

  def update
    set_line = self.class.columns
      .map{ |attr| "#{attr} = ?"}

      DBConnection.excute(<<-SQL, *attribute_values, id)
        UPDATE
          #{self.class.table_name}
        SET
          #{set_line}
        WHERE
          #{self.class.table_name}.id = ?
      SQL
  end

  def save
    id.nil? ? insert :update    
  end
end
