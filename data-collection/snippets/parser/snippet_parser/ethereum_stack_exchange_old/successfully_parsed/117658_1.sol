    function addQuestion(string calldata _option1) public {
        uint _id = 1;
        Question storage quest = mapQuestions[_id];
        quest.questionId = _id;
        quest.options.push(Option(_id, _option1));
    }
