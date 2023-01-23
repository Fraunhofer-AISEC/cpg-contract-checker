
pragma solidity ^0.5.2;

import "./TestBase.sol";

contract Test is TestBase{
    string[] name ;

    constructor() public payable {
      name.push("sheep");
      name.push("fox");
      name.push("whale");
    }

    function getNames() public returns(string[] memory){
        emit Log("Test",address(this),msg.sender,tx.origin);
        display();
        return name;
    }
}


pragma solidity ^0.5.2;

contract TestBase2 {
    event Log(string context,address,address,address);

    function display2() public returns(address){
        emit Log("TestBase2",address(this),msg.sender,tx.origin);
        return msg.sender;
    }

}

contract TestBase is TestBase2{

    function display() public returns(address){
        emit Log("TestBase",address(this),msg.sender,tx.origin);
        display2();
        TestBase3 t = new TestBase3();
        t.display();
        return msg.sender;
    }
}

contract TestBase3 {
    event Log(string context,address,address,address);

    function display() public returns(address){
        emit Log("TestBase3",address(this),msg.sender,tx.origin);

        return msg.sender;
    }
}
