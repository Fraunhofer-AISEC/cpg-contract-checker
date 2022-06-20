pragma solidity ^0.4.21;

contract GetandSet{

    string name;
    uint age;

    function GetandSet() public {



    }

    function set(string newName, uint newAge) public {

        name = newName;
        age = newAge;
    } 


    function get() public view returns (string, uint) {

        return (name,age);
    }


}
