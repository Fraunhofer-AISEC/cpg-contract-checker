pragma solidity ^0.4.8;

contract myFirstContract
{
    address[] public childContracts;
    uint public idd;
    string public name1;

    function newContracts(uint _id,string _name) public returns(address _newContract)
    {
        uint id=_id;
        string memory name=_name;
        anotherContract a = new anotherContract(id,name);
        childContracts.push(a);
        return a;
    }

    function getContractData(uint _address) public
    {

    }
}

contract anotherContract
{
    string public name;
    uint  public id;
    constructor(uint _id,string _name) public
    {
        name=_name;
        id=_id;
    }
}
