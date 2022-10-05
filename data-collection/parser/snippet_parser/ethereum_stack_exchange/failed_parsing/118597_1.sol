pragma solidity 0.8.0;

contract TestContract {
    Interface interface_instance_one = Interface(<CONTRACT_ADDRESS_ONE>);
    Interface interface_instance_two = Interface(<CONTRACT_ADDRESS_TWO>);
}

interface Interface {
    function someCall(address sender) external;
}
