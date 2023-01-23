function addQuestion(bytes32 _name, bytes32[] _answers) onlyOwner {
    Answer[] memory answersLocal = new Answer[](_answers.length);

    for (uint i = 0; i < _answers.length; i++) {
        answersLocal[i] = Answer({
            name: _answers[i],
            voteCount: 0
        });
    }

    questions.push(Question({
        name: _name,
        answers: answersLocal
    }));
}
