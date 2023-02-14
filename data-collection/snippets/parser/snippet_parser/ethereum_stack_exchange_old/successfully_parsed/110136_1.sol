mapping(bytes4 => Question) private questions;

struct Question {
bytes8[] answers;
mapping(bytes32 => bool) answerers;
}

function newQuestion(bytes4 uid, bytes8 _answer, bytes32 _answerer) public {

   Question storage newQ = questions[uid];
   newQ.answers.push(_answer);
   newQ.answerers[_answerer] = true;

}
