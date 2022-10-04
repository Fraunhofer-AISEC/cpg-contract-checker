pragma solidity ^0.4.2;

contract Election {
    string public candidateName;
    string public candidateotherName;



    function Election () public {
        candidateName = "Candidate 1";
        candidateotherName = "Candidate2";
    }

    function setCandidate (string _name) public {

       candidateName = _name;
    }


     function setOtherCandidate (string _othername) public {
     candidateotherName = _othername;

}
}
