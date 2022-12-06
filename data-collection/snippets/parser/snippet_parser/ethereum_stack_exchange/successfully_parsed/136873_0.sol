mapping (address => uint) balanceAllowance;
address public owner; 

constructor () {
    owner = msg.sender;
}

function setNewOwner (address _address) public view {
    owner == _address;
}
