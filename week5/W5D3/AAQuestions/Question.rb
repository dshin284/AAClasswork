require_relative 'QuestionsDatabase.rb'

class Question
    
    def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        question_options = QuestionsDBConnection.instance.execute(<<-SQL )
            SELECT
                *
            FROM
                questions
            WHERE
                questions.id = id
        SQL
        puts question_options
        Question.new(question_options)   
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author = options['author']
    end
    


    # CREATE TABLE questions(
    # id INTEGER PRIMARY KEY,
    # title STRING NOT NULL,
    # body STRING NOT NULL,
    # author INTEGER NOT NULL,
    # FOREIGN KEY (author) REFERENCES users(id)

end