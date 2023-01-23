mapping (address => uint256) public howMuch;
function deposit() public payable {
    howMuch[msg.sender] += msg.value;
}
