pragma solidity ^0.4.24;

contract Learning {

    constructor () public payable {
        
        require(msg.value == 1000);
    }

    function test() public returns (bool) {
        
        transfer(0x0000000000000000000000000000000000000001, 1, 700);
        return true;
    }

    function transfer(address _account, uint _wei, uint _gas) private {
        require(_account.call.value(_wei).gas(_gas)());
    }
}
