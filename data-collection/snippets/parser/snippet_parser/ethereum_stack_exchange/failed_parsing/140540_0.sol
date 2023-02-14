contract SendEther{

mapping(address => uint) balanceOf;

function send(uint256 _transfer) public payable {

_transfer = msg value;
balanceOf[msg.sender] += _transfer;

}
}

