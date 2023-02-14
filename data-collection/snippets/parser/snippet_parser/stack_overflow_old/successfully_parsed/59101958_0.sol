contract Payment{ 
address Account2;
address Owner;

constructor() public{
    Account2 = 0x583031D1113aD414F02576BD6afaBfb302140225;
    Owner = msg.sender;
}
function deposit() payable public{
    address(uint160(Account2)).transfer(1 ether);
}
}