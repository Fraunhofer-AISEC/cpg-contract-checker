pragma solidity ^0.4.17;

contract ABC {

    bytes32 public name;
    uint public value;

    function ABC(bytes32 _name, uint _val) public {
        name = _name;
        value = _val;
    }
}

contract ABC_Creator {

    ABC localABC;
    mapping (bytes32 => address[]) public abcMap;
    event Log(bytes32, uint);

    function createABC(bytes32 _name, uint _val) public {
        localABC = new ABC(_name, _val);
        abcMap[_name].push(localABC);
    }

    function getABCList(bytes32 _name) public {

        uint len = abcMap[_name].length;
        for (uint i = 0; i < len; i++) {
            Log(ABC(abcMap[_name][i]).name(), ABC(abcMap[_name][i]).value());
        }

    }


}
