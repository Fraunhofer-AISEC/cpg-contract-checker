pragma solidity ^0.5.9;

contract Squads{

    struct squadMemberInfo{
        string memberName;
        address memberAddress;
    }
    struct squadInfo{
        string squadName;
         squadMemberInfo[] squadMembers;
    }
    squadInfo[] public SI;
    squadMemberInfo[] public SMI;
    
    function createSquad(address[] memory _addressesToBeGrouped,string memory _squadName) public returns(string memory isCreated){
        
    }
    
    function addMember(string memory _squadName,address _memberAddress, string memory _memberName) public returns(bool isAdded){
        squadMemberInfo memory squadMember = squadMemberInfo(_memberName,_memberAddress);
        SMI.push(squadMember);
        squadInfo memory squadInformation = squadInfo(_squadName,SMI);
        SI.push(squadInformation);
        return true;
    }

}
