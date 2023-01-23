pragma solidity ^0.4.15;

contract Data {

    mapping (bytes32 => uint[])  public contractsMap;

}

contract ContractCreator {

    Data myData;
    uint[] myValueList;

    event Log(bytes32, uint);

    function ContractCreator() public {

        myData = new Data();
    }

    function setElements (bytes32 _name, uint _value) public {

        myData.contractsMap[_name].push(_value); 
    }

    function getElements (bytes32 _name) public {

       myValueList = myData.contractsMap[_name];
       for (uint i = 0; i < myValueList.length; i++) {
           Log(_name, myValueList[i]);
       }
    }
}
