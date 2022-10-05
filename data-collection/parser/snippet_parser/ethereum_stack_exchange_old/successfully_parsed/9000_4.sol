pragma solidity ^0.4.17;

contract VotethComment {

    string public comment;
    string public nickname;
    address public author;
    address[] public votethComments;
    address votethCommentMaker;

    constructor(string _comment, string _nickname, address _author, address _votethCommentMaker) public {
        comment = _comment;
        nickname = _nickname;
        author = _author;
        votethCommentMaker = _votethCommentMaker;
    }

    function addComment(string _comment, string _nickname) public {
        VotethCommentSupplier votethCommentSupplier = VotethCommentSupplier(votethCommentMaker);
        votethComments.push(votethCommentSupplier.makeComment(_comment, _nickname, msg.sender));
    }
}

contract VotethCommentSupplier {
   function makeComment(string _comment, string _nickname, address _author) public returns(address);
}

contract VotethCommentMaker {
    function makeComment(string _comment, string _nickname, address _author) public returns(address) {
        return new VotethComment(_comment, _nickname, _author, this);
    }
}
