pragma solidity ^0.6.0;

contract Proxy {
    
    address client;

    constructor(address _client) public {
        client = _client;
    }

    
    
    function forward(bytes calldata _payload) external {
        bytes4 sig = abi.decode(_payload[:4], (bytes4));
        if (sig == bytes4(keccak256("setOwner(address)"))) {
            address owner = abi.decode(_payload[4:], (address));
            require(owner != address(0), "Address of owner cannot be zero.");
        }
        (bool status,) = client.delegatecall(_payload);
        require(status, "Forwarded call failed.");
    }
}
