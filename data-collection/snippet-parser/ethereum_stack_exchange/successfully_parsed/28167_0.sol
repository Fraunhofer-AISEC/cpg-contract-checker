pragma solidity ^0.4.17;

contract DeployedContract {
    uint public result = 0;

    function add(uint input) {
        result = result + input;
    }
}


contract Proxy {    
    address deployed_contract = 0x123;

    function call1(uint lucky_number) { 
        deployed_contract.call(bytes4(sha3("add(uint)")),lucky_number);
        
    }

    function call2(uint lucky_number) { 
        deployed_contract.call(bytes4(sha3("add(uint256)")),lucky_number);
        
    }

    function call3(uint lucky_number) {
        deployed_contract.call(0x1003e2d2,lucky_number);
        
        
    }

    function call4() {
        deployed_contract.call(0x1003e2d20000000000000000000000000000000000000000000000000000000000000005);
        
    }

    function call5(bytes32 data) {
        
        deployed_contract.call(data); 
        
    }

}
