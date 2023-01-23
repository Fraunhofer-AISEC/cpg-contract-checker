
pragma solidity^ 0.8.10;
contract B{
    event called(address _add, uint val);
    uint public money;
    fallback() external payable{}
    function callMe(uint val) public payable{
        money+=val;
        emit called(msg.sender,val);
    }
}

contract A{
    constructor() payable{}
    function callB(address _b,uint val) public payable{
        (bool success, )=_b.call(abi.encodeWithSignature("callMe(uint)",val));
        require(success);
    }
}
