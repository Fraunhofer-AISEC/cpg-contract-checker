

pragma solidity 0.8.8;

contract SimpleStorage{

    struct People{
        string name;
        uint256 age;
    }

    People[] person;

    function setPerson(string memory _name, uint256 _age) public{
        People memory newPerson = People({name:_name, age:_age});
        person.push(newPerson);
    }

    function getPerson() public view returns (People[] memory){
        return person;
    }
}
