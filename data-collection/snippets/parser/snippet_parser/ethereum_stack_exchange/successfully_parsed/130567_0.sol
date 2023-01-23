struct Option {
    string option;
}

struct Question {
    string question;
    string answer;
    Option[] options;
}

struct Quiz {
    address author;
    string title;
    string description;
    Question[] questions;
}

Survey[] private surveys;

function createQuiz(string memory _title, string memory _description, string[] _questions, string[][] _options) {}
