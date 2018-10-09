require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_likes'

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

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_question
    QuestionFollow.followed_question_for_user_id(@id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end

  def average_karma
    QuestionsDatabase.get_first_value(<<-SQL, @id)
    SELECT
      CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT(questions.id))
    FROM
      questions
    LEFT OUTER JOIN
      question_likes
    ON
      question_likes.question_id = questions.id
    WHERE
      questions.author_id = 1;
   SQL
  end


end
