contract Control {
address public owner;
address public newOwner;

event OwnershipTransferred(address indexed _from, address indexed _to);

function Owned() public {
    owner = msg.sender;
}


modifier onlyOwner {
    require(msg.sender == owner);
    _;
}

function withdrawAll() public payable onlyOwner {
    require(payable(msg.sender).send(address(this).balance));
}

}
