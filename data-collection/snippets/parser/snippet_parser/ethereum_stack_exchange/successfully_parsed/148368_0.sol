
pragma solidity ^0.8.6;
pragma experimental ABIEncoderV2;

contract Voting{

    string[] public members;
    mapping(string => uint) public memberVote;
    mapping(address => bool) public voted;

    function addMember(string memory name) public {
        bool repeated=false;
        for(uint i=0; i < members.length; i++){
            if(keccak256(abi.encodePacked((name))) == keccak256(abi.encodePacked(members[i]))){
                repeated = true;
            }
        }
        if(repeated==false){
            members.push(name);
            memberVote[name] = 0;
        }
    }

    function Vote(string memory name) public{
        require(voted[msg.sender]==false, 'one address one vote');
        memberVote[name] = memberVote[name]+1;
        voted[msg.sender]=true;
    }

    function highestVoted() public view returns(string memory){
        uint maxIndex=0;
        uint maxVote=0;
        for(uint i = 0; i<members.length; i++){
            if(memberVote[members[i]]>maxVote){
                maxIndex=i;
                maxVote=memberVote[members[i]];
            }
        }
        return members[maxIndex];
    }

    function getMembers() public view returns(string[] memory){
        return members;
    }
    function getVotes(string memory member) public view returns(uint){
        return memberVote[member];
    }

}
