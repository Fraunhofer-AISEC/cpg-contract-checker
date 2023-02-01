modifier inStatus(uint256 _qid, Status _status) {
    require(
        mapQuestions[_qid].status == _status,
        "Operation not valid, invalid question status."
    );
    _;
}

function enableQuestion(uint256 _qid) public onlyOwner validQuestion(_qid) {
    require(
        (mapQuestions[_qid].status == Status.New || mapQuestions[_qid].status == Status.Closed),
        "Operation not valid, invalid question status."
    );
    mapQuestions[_qid].status = Status.Open;
}

function disableQuestion(uint256 _qid) public onlyOwner validQuestion(_qid) inStatus(_qid, Status.Open) {
    mapQuestions[_qid].status = Status.Closed;
}
