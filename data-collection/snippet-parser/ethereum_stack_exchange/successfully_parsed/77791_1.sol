pragma solidity 0.4.26; 

contract MyContract
{
    address[] public childContracts;

    function newContracts(uint _id,string _name) public returns(address _newContract)
    {
        uint id=_id;
        string memory name=_name;
        AnotherContract a = new AnotherContract(id,name);
        childContracts.push(a);
        return a;
    }
}

contract AnotherContract
{
    string public name; 
    uint public id;
    constructor(uint _id,string _name) public 
    {
        name=_name;
        id=_id;
    }
}
