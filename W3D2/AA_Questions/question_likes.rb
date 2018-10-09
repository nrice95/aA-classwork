require_relative "questions_database"
require_relative "user"

class QuestionLikes
  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.*
    FROM
      users
    JOIN
      question_likes ON question_likes.liker_id = users.id
    WHERE
      question_id = ?
  SQL
  likers.length == 0 ? nil : likers.map {|liker| User.new(liker)}
  end

  def self.num_likes_for_question_id(question_id)
    count = QuestionsDatabase.instance.execute(<<-SQL,question_id)
      SELECT
        Count(users.id)
      FROM
        users
      JOIN
        question_likes ON question_likes.liker_id = users.id
      WHERE
        question_id = ?
    SQL
    hash = count.first
    hash.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        question_likes.liker_id = ?
    SQL

    liked_questions == 0 ? nil : liked_questions.map {|question| Question.new(question)}
  end

  def self.most_liked_questions(n)
    liked_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.*
    FROM
      questions
    JOIN
      question_likes ON question_likes.question_id = questions.id
    GROUP BY
      questions.id
    ORDER BY
      COUNT(question_likes.id) DESC
    LIMIT
      ?
    SQL

    liked_questions.length == 0 ? nil : liked_questions.map {|question| Question.new(question)}
  end
end
