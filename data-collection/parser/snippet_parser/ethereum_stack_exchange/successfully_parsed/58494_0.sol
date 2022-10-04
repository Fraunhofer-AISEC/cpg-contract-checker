pragma solidity ^0.4.24;

contract Home {

    address[] public deployedConferences;
    address[] public members;
    uint public totalMembers;

    event JoinedDXCon(address indexed memAddr, string name);

    function createConference(string _confName) public {
        address newConference = new Conference(_confName, msg.sender);
        deployedConferences.push(newConference);
    }

    function getDeployedConferences() public view returns(address[]) {
        return deployedConferences;
    }

    function joinDXCon(string _name) public {
        members[totalMembers] = msg.sender;
        totalMembers++;

        emit JoinedDXCon(msg.sender, _name);
    }
}
