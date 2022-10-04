pragma solidity ^0.4.25;

contract Chatroom {
address public host;
string private password;

address[] public members;
Message[] public chatLog;

mapping(uint => Message) msgIDPair;
mapping(address => bool) isMember;

struct Message {
    address author;
    string content;
}




constructor(string _password) public {
    host = msg.sender;
    addMember(host); 

    password = _password;
}



function sendMessage(string _message) external mustBeMember {
    uint msgID = chatLog.length + 1;

    msgIDPair[msgID] = Message(msg.sender, _message); 
    chatLog.push(msgIDPair[msgID]); 
}





function getMessage(uint _ID) public view mustBeMember returns(string) {
    return(msgIDPair[_ID].content);
}




function checkMember(address _target) public view returns(bool) {
    if (isMember[_target] == true) { 
        return(true);
    }
    else { 
        return(false);
    }
}

modifier mustBeMember() {
    require(checkMember(msg.sender) == true);
    _;
}




function joinChat(string _password) public requirePassword(_password) {
    addMember(msg.sender);
}


function leaveChat() public mustBeMember {
    require(msg.sender != host); 

    for (uint i = 0; i < members.length; i++) { 
        if (members[i] == msg.sender) {
            swapReduceIndex(members, i);
        }
    }

    isMember[msg.sender] = false;
}




function addMember(address _newMember) private {
    if (isMember[_newMember] == true) { 
        return();
    }
    else { 
        isMember[_newMember] = true;
        members.push(msg.sender);
    }
}



function getMembers() public view returns(address[]) {
    return(members);
}

modifier requirePassword(string _password) {
    require(keccak256(password) == keccak256(_password));
    _;
}

modifier onlyHost {
    require(msg.sender == host);
    _;
}



function kickMember(address _member) external onlyHost {
    require(msg.sender != _member); 

    for (uint i = 0; i < members.length; i++) { 
        if (members[i] == _member) {
            swapReduceIndex(members, i);
        }
    }

    isMember[_member] = false;
}



function switchHost(address newHost) external onlyHost {
    require(checkMember(newHost));

    host = newHost;
}





function swapReduceIndex(address[] storage array, uint _blankIndex) internal {
    delete array[_blankIndex];
    uint lastIndex = array.length-1;
    array[_blankIndex] = array[lastIndex];
    array.length--;
}



function getMessagesLength() external view returns (uint) {
  return(chatLog.length);
}

}
