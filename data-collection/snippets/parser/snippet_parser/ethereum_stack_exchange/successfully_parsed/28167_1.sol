pragma solidity ^0.4.17;

contract DeployedContract {
    uint public result = 0;

    function add(uint input) {
        result = result + input;
    }
}

contract Proxy {    
    address deployed_contract = 0x123;

    function directCall() public {
        DeployedContract(deployed_contract).add(123);
    }
}
