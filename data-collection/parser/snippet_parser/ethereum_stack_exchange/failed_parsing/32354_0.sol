pragma solidity ^0.4.0;

contract MyContract {
  
}

contract MappingExample {
    mapping(uint32 => MyContract) inner_contracts;

    function do_something(uint32 key) {
        MyContract c;
        if() {
            c = inner_contracts[key];
        } else {
            c = new MyContract;
            inner_contracts[key] = c;
        }

        
    }
}
