require_relative "questions_database"
require_relative "user"

class QuestionFollow

  def self.find_by_id(id)
    follows = QuestionsDatabase.instance.execute(<<-SQL,id)
      SELECT
        question_follows.*
      FROM
        question_follows
      WHERE
        question_follows.id = ?
    SQL

    follows.length == 0 ? nil : follows.map {|follow| QuestionFollow.new(follow)}
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL

    followers.length == 0 ? nil : followers.map{|follower| User.new(follower)}

  end

  def self.followed_question_for_user_id(user_id)
    followed_questions = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL

    followed_questions.length == 0 ? nil : followed_questions.map{|question| Question.new(question)}
  end

  def self.most_followed_questions(n)
    most_followed = QuestionsDatabase.instance.execute(<<-SQL,n)
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_follows ON question_follows.question_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(questions.id) DESC
    LIMIT
      ?
    SQL
    most_followed.length == 0 ? nil: most_followed.map {|question| Question.new(question)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
