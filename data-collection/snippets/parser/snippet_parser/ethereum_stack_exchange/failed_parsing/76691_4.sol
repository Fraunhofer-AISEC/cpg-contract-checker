address payable public owner;

modifier onlyOwner {
   require(msg.sender == owner);
   _;
}

constructor() public {
   owner = msg.sender;
}

function kill() public onlyOwner {
   selfdestruct(owner);
}
