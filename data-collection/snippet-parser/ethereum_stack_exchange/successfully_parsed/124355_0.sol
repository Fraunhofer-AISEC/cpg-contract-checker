pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
   
    struct Voter {
        string title;
        string description;  
        string organization; 
        string ballotType;
        uint voteRights;
        uint noOfVoters;
        string option1;
        string option2;
        string option3;
        string option4;   
    }

    mapping(uint=>Voter) public voting;

    function addItems(string memory _title,string memory _description,string memory _organization,string memory _ballotType,uint _voteRights,uint _noOfVoters,string memory _option1,string memory _option2,string memory _option3,string memory _option4) public
    {
       voting.title=_title;
       voting.description=_description;
       voting.organization=_organization;
       voting.ballotType=_ballotType;
       voting.voteRights=_voteRights;
       voting.noOfVoters=_noOfVoters;
       voting.option1=_option1;
       voting.option2=_option2;
       voting.option3=_option3;
       voting.option4=_option4;
    }

}
