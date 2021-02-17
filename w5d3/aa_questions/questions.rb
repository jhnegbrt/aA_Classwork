require './questions_database.rb'

class Question

  attr_accessor :id, :title, :body, :user_id

  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM questions")
    data.map { |row| Question.new(row) }
  end

  def self.find_by_id(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    Question.new(result[0])
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

end