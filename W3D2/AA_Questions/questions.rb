require 'sqlite3'
require "singleton"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def self.find_by_id(id)
    row = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
    SQL

    User.new(row.first)
  end

  def self.find_by_name(fname,lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = ? AND users.lname = ?
    SQL

    users.map {|user| User.new(user)}

  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

end

class Question
  attr_accessor :title, :body, :author_id

  def self.find_by_id
    row = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?
    SQL

    Question.new(row.first)
  end

  def self.find_by_title
    titles = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.title = ?
    SQL

    titles.map {|title| Question.new(title)}
  end

  def self.find_by_author_id
  end
