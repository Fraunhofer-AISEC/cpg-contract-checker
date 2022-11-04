
pragma solidity >=0.7.0 <0.9.0;

contract contractAInterface {
    mapping(string => uint256) public testMapping;
}

contract contractB {

    address contractAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    contractAInterface contractA = contractAInterface(contractAddress);

    function setValueOfMapping(string memory _key, uint256 _value) public {
        contractA.testMapping(_key) = _value;
    }
}
