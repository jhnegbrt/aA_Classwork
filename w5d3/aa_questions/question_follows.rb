require './questions_database.rb'
require './users.rb'
require './questions.rb'

class QuestionFollow

  attr_accessor :question_id, :user_id
  
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM question_follows")
    data.map { |row| QuestionFollow.new(row) }
  end

  def self.question_followers(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT id, fname, lname
      FROM question_follows
      JOIN users ON question_follows.user_id = users.id
      WHERE question_id = ?
    SQL
    result.map {|user_data| User.new(user_data)}
  end

  def self.users_follows(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT id, title, body, question_follows.user_id
      FROM question_follows
      JOIN questions ON question_follows.question_id = questions.id
      WHERE question_follows.user_id = ?
    SQL
    result.map {|question_data| Question.new(question_data)}
  end

  def self.most_followed_questions(n=1)
    result = QuestionsDB.instance.execute(<<-SQL, n)
      SELECT id, title, body, question_follows.user_id
      FROM question_follows
      JOIN questions ON question_follows.question_id = questions.id
      GROUP BY question_id
      ORDER BY COUNT(question_follows.user_id) DESC
    SQL
    result.map {|question_data| Question.new(question_data)}
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end