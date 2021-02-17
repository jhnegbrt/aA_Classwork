require './questions_database.rb'

class Reply

  attr_accessor :id, :question_id, :user_id, :parent_id, :body
  
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM replies")
    data.map { |row| Reply.new(row) }
  end

  def self.find_by_id(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    Reply.new(result[0])
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

end