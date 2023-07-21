import "./Child.sol";

contract Factory {
    event ContractDeployed(address indexed contractAddress);

    function deployContract(bytes32 _salt) public returns (address) {
        Child c = new Child{salt: _salt}();
        address addr = address(c);

        emit ContractDeployed(addr);

        return addr;
    }
}
