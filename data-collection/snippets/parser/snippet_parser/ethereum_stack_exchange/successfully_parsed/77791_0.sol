pragma solidity ^0.4.8;

contract myContract
{
    address[] public childContracts;

    function newContracts(uint _id,string _name) public returns(address _newContract)
    {
        uint id=_id;
        string memory name=_name;
        anotherContract a = new anotherContract(id,name);
        childContracts.push(a);
        return a;
    }
}

contract anotherContract
{
    string name;
    uint id;
    constructor(uint _id,string _name)
    {
        name=_name;
        id=_id;
    }
}


