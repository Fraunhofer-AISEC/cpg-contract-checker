pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/lifecycle/Destructible.sol";
import "./Organization.sol";

contract Consortium is Destructible {

    
    struct Member {
        string name;
        address member;
        Organization organization;
        uint since;
    }

    mapping (address => uint) public memberId;
    Member[] public members;

    
    event MembershipChanged(address member, bool isMember);

    
    modifier onlyMembers {
        require(memberId[msg.sender] != 0);
        _;
    }

    

    
    function Consortium() public {
        addMember(owner, "Consortium Funder");
    }

    
    function addMember(address _targetMember, string _memberName) onlyOwner public returns(bool) {
        uint id = memberId[_targetMember];
        if (id == 0) {
            memberId[_targetMember] = members.length;
            id = members.length++;
        }

        Organization org = new Organization(_memberName);
        org.transferOwnership(_targetMember);
        members[id] = Member({name: _memberName, member: _targetMember, organization: org, since: now});
        emit MembershipChanged(_targetMember, true);
        return true;
    }

    
    function updateMemberName(string _name) onlyMembers public returns (bool) {
        members[memberId[msg.sender]].name = _name;
        return true;
    }

    
    function updateMember(string _name, address _memberAddress) onlyMembers public returns (bool) {
        Member storage member = members[memberId[msg.sender]];
        member.name = _name;
        address orgAddress = address(member.organization);
        orgAddress.delegatecall(bytes4(keccak256("transferOwnership(address)")), _memberAddress);
        member.member = _memberAddress;
        emit MembershipChanged(_memberAddress, true);
        return true;
    }

    
    function removeMember() onlyMembers public {
        for (uint i = memberId[msg.sender]; i < members.length-1; i++){
            members[i] = members[i+1];
        }
        memberId[msg.sender] = 0;
        delete members[members.length-1];
        members.length--;
    }

    
    function removeMember(address _targetMember) onlyOwner public {
        require(memberId[_targetMember] != 0);

        for (uint i = memberId[_targetMember]; i < members.length-1; i++){
            members[i] = members[i+1];
        }
        memberId[_targetMember] = 0;
        delete members[members.length-1];
        members.length--;
    }

    
    function isMember(address _targetMember) public view returns (bool) {
        return memberId[_targetMember] != 0;
    } 

    
    function numMembers() public view returns (uint) {
        return members.length;
    }
}
