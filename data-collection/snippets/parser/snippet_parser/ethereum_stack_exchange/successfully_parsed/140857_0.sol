pragma solidity >=0.7.0 <0.9.0;
struct Student
{
    int roll;
    string name;
}
contract Test {
Student public s1;
    constructor(int n,string memory namee)
    {
        s1.roll=n;
        s1.name=namee;
        
    }
}
