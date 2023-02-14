pragma solidity ^0.8.0;

 contract helloworld{

    string Name ="mmo";

    function  getName() public view returns(string memory)
    {
        return Name;
    }
}
