require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class Reply
attr_accessor :subject_question_id, :parent_reply_id, :user_id, :body

  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
  SQL
  replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_user_id(user_id)
    user_ids = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      replies
    WHERE
      user_id = ?
  SQL
  user_ids.map {|user_id| Reply.new(user_id)}
end

def self.find_by_question_id(subject_question_id)
  subject_question_ids = QuestionsDatabase.instance.execute(<<-SQL, subject_question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.subject_question_id = ?
  SQL

  subject_question_ids.length == 0 ? nil : subject_question_ids.map {|id| Reply.new(id)}
end

def self.find_by_parent_id(parent_id)
  children = QuestionsDatabase.instance.execute(<<-SQL,parent_id)
    SELECT
      *
    FROM
      replies
    WHERE
      replies.parent_reply_id = ?
  SQL

  children.map {|child| Reply.new(child)}
end

def initialize(options)
  @id = options['id']
  @subject_question_id = options['subject_question_id']
  @parent_reply_id = options['parent_reply_id']
  @user_id = options['user_id']
  @body = options['body']
end

def author
  User.find_by_id(self.user_id)
end

def question
  Question.find_by_id(self.user_id)
end

def parent_reply
  Reply.find_by_id(self.parent_reply_id)
end

def child_replies
  Reply.find_by_parent_id(@id)
end

end
