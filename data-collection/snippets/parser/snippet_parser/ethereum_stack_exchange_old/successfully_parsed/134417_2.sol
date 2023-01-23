contract contractAInterface {
    mapping(string => uint256) public testMapping;
    function mutateTestMapping(string memory key, uint256 value) external {
        testMapping[key] = value;
    }
}

contract contractB {

    address contractAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    contractAInterface contractA = contractAInterface(contractAddress);

    function setValueOfMapping(string memory _key, uint256 _value) public {
        contractA.mutateTestMapping(_key, _value);
    }
}
