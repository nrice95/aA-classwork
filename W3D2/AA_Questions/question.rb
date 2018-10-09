require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_likes'

class Question
  attr_accessor :title, :body, :author_id

  def self.find_by_id(id)
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

  def self.find_by_title(title)
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

  def self.find_by_author_id(author_id)
    auth_ids = QuestionsDatabase.instance.execute(<<-SQL, author_id)

    SELECT
      *
    FROM
      questions
    WHERE
      questions.author_id = ?
  SQL

  auth_ids.map {|auth_id| Question.new(auth_id)}
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @author_id = options['author_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies #query search
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

end
