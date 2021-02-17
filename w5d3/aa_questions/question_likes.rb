require './questions_database.rb'
require './users.rb'
require './questions.rb'

class QuestionLike

  attr_accessor :question_id, :user_id
  
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM question_likes")
    data.map { |row| QuestionLike.new(row) }
  end

  def self.question_likers(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT id, fname, lname
      FROM question_likes
      JOIN users ON question_likes.user_id = users.id
      WHERE question_id = ?
    SQL
    result.map {|user_data| User.new(user_data)}
  end

  def self.users_likes(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT id, title, body, question_likes.user_id
      FROM question_likes
      JOIN questions ON question_likes.question_id = questions.id
      WHERE question_likes.user_id = ?
    SQL
    result.map {|question_data| Question.new(question_data)}
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end