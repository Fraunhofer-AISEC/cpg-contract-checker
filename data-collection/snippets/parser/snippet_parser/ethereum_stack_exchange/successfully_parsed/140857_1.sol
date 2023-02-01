pragma solidity >=0.7.0 <0.9.0;

contract Test {
    struct Student
    {
        int roll;
        string name;
    }

    Student public s1;
    
    constructor(int n, string memory name)
    {
        s1.roll=n;
        s1.name=name;
        
    }
}
