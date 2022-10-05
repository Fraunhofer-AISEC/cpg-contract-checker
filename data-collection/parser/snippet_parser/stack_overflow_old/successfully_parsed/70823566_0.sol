
pragma solidity ^0.8.11;

contract shop{
    struct student{
        string name;
        uint roll;
    }
    student[] public s;
    function setstudent() public{
        s[0].name = "sam";
        s[0].roll = 98246;
    }
}
