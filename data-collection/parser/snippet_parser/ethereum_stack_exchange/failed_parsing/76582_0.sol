pragma solidity ^0.5.1;

contract MyContract{
    struct student{
        int RollNo;
        string Name;
    }

    student public s1=student({RollNo:1, Name:"Test Bunny"});

    int public disint; string public disname;
    disint=s1.RollNo;
    disname=s1.Name;
}

