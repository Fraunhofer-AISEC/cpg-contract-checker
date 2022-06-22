pragma solidity ^0.4.11;



contract Register {
    address owner;
    mapping (string => address) public backends;

    function Register() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function changeBackend(string contractName, address newBackend) public onlyOwner() returns (bool) {
        if(newBackend != backends[contractName]) {
            backends[contractName] = newBackend;
            return true;
        }

        return false;
    }
}
