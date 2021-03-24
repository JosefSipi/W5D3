require 'sqlite3'
require 'singleton'


class QuestionsDB < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User

    def self.find_by_id

    end

    def self.find_by_name(fname,lname)

    end

end

class Questions

    def self.find_by_id(questions_id)
        question_query = QuestionsDB.instance.execute(<<-SQL, questions_id)
        SELECT
            *
        FROM
            questions
        WHERE
            questions_id = ? 
    SQL
    Questions.new(question_query)
    end
 

    attr_accessor :id, :title, :body, :author_id
    def initialize(options)
        @id = options[id]
        @title = options[title]
        @body = options[body]
        @author_id = options[author_id]

    end


end

class QuestiionFollows
    def self.find_by_id

    end
end

class Replies
    def self.find_by_id

    end
end

class QuestionLikes
    def self.find_by_id

    end

end  