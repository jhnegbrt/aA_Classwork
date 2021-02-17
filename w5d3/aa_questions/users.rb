require './questions_database.rb'

class User

  attr_accessor :id, :fname, :lname
  
  def self.all
    data = QuestionsDB.instance.execute("SELECT * FROM users")
    data.map { |row| User.new(row) }
  end

  def self.find_by_id(int)
    result = QuestionsDB.instance.execute(<<-SQL, int)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    User.new(result[0])
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

end