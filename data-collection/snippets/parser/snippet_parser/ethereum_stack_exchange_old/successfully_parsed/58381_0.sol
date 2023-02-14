pragma solidity ^0.4.17;

contract EtherBox {
    uint balance;

    constructor () public payable  {}

    function SetBalance() public payable {
        balance = balance + 10;
    }

    function GetBalance() public payable returns(uint) {
       return balance;
    }
}

contract UsingCall {
    constructor () public payable  {}

    function SimpleCall(address addr) public payable returns (uint) {
        bool status = true;
        
        EtherBox eb = EtherBox(addr);
        address myaddr = address(eb);
        status = myaddr.call(bytes4(keccak256("SetBalance()")));
        return eb.GetBalance();
    }

    function SimpleCallwithGas() public returns (bool) {
        bool status = true;
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        status = myaddr.call.gas(200000)(bytes4(keccak256("GetBalance()")));
        return status;
    }

    function SimpleCallwithGasAndValue() public returns (bool) {
        bool status = true;
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        status = myaddr.call.gas(200000).value(1)(bytes4(keccak256("GetBalance()")));
        return status;
    }

}
