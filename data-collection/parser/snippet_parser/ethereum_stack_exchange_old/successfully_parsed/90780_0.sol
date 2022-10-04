pragma solidity ^0.4.17;
contract Election{
    struct candidate{
        string name;
        uint votecount;
    }
    struct voter{
        bool authorized;
        bool voted;
        uint vote;
    }
    address public owner;
    string public electionName;
    mapping(address=>voter) voters;
    candidate[] public candidates;
    uint public totalVotes;
    function Election(string _name) public{
        owner = msg.sender;
        electionName = _name;
    }
    
    modifier ownerOnly(){
        require(msg.sender==owner);
        _;
    }
    function addCandidate(string _name) ownerOnly public{
        candidates.push(candidate(_name,0));
    }
    function getNumcandidate() public view returns(uint){
        return candidates.length;
    }
    function authorize(address _person) ownerOnly public{
        voters[_person].authorized=true;
    }
    function vote(uint _voteIndex) public{
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorized);
        
        voters[msg.sender].vote =_voteIndex;
        voters[msg.sender].voted = true;
        candidates[_voteIndex].votecount +=1;
        totalVotes+=1;
    }
    function whoWon() ownerOnly public view returns(string){
        uint maxi=0;
        string memory winner;
        for(uint i=0;i<getNumcandidate();i++)
        {
            if(candidates[i].votecount>maxi)
            {
                maxi=candidates[i].votecount;
                winner=candidates[i].name;
            }
        }
        return winner;
    }
    function end() ownerOnly public returns(uint){
        selfdestruct(owner);
    }
}
