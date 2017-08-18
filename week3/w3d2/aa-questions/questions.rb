require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'reply'
require_relative 'questions_follow'
require_relative 'question-like'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db') #careful! must be db
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)

    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  #Select queries want to return arrays of hashes so question var below must be indexed into to get just the hash
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    questions.map { |question| Question.new(question) }
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
end
