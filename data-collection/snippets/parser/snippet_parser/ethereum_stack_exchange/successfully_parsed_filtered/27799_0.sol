pragma solidity ^0.4.15;
contract ABC {

    bytes32 public name;
    uint public number;
    event Log(string _myString);        

    function ABC (bytes32 _name, uint _number) public {
        Log("object created");
        name = _name;
        number = _number;

    }
}

contract XYZ {

    ABC myABC;

    event Log(string _myString);

    function create(bytes32 _name, uint _number) public returns (bool isSuccess) {

        Log("checking name");
        require(_name != 0);

        Log("name valid, now checking number");
        require(_number != 0);

        Log("name and number non-empty, creating a new contract");
        myABC = new ABC(_name,_number);

        Log("new contract created");

        return true;

    }


}
