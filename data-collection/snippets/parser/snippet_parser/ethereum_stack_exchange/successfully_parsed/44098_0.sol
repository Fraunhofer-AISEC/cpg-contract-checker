mapping(address => uint) balanceOf;

function pay() public payable {
    require(msg.value > 0);
    balanceOf[msg.sender] = msg.value;
}
