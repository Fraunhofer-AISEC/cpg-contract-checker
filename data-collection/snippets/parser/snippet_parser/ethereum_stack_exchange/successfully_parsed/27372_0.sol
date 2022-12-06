pragma solidity ^0.4.15;

contract TestContract {

    uint public iD;
    bytes32 public name;
    function setAttr(uint _id, bytes32 _name) {
        iD = _id;
        name = _name;
    }
}

contract Factory {

    TestContract myTest;
    address contractAddress;
    function Factory () {
        myTest = new TestContract();
        myTest.setAttr(100,"0x111");
        contractAddress = address(myTest);
    }

    event LogData(uint _mydata, bytes32 _name);
    event LogAddress(address _add);
    function getContract() {
        myTest = TestContract(contractAddress);
        LogAddress(contractAddress);
        LogData(myTest.iD(), myTest.name());
    }

}
