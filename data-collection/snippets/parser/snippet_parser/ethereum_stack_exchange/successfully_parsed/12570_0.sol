pragma solidity ^0.4.8;

contract A {

    event trace(address a);

    struct details { string name; uint roll ;} 

    mapping (address => details) public testMap;

    function set (string name, uint roll) {

        Student instance = new Student(name, roll);
        testMap[instance] = details(name,roll);

    }

    function get (address a) {

        testMap[a];

        
    }
}


contract Student {

    function Student(string name, uint roll) {

    }


}
