 
    function addQuestion(uint _questionNumber, string memory _question, string memory _answer) public {
        require(msg.sender == administrator, "Only the administrator can add questions to the exam.");
        require(_questionNumber > 0 && _questionNumber <= numQuestions, "Invalid question number.");
        require(questions[_questionNumber] == bytes32(0), "Question has already been added.");

        questions[_questionNumber] = _question;
        answers[_questionNumber] = _answer;
    }

    
    function submitAnswers(uint[] memory _answers) public {
        require(isOpen, "Exam is closed.");
        require(_answers.length == numQuestions, "Incorrect number of answers.");
        address user = msg.sender;
        Submission storage submission = submissions[user];
        submission.numAttempts++;

        require(submission.numAttempts <= maxAttempts, "Exceeded maximum number of attempts.");

        
        submission.score = 0;
        for (uint i = 0; i < numQuestions; i++) {
            if (_answers[i] == uint(answers[i])) {
 {submission.score++;
            }
        }

        submission.answers = _answers;
    }}
