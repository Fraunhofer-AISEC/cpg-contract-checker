pragma solidity ^0.4.13;

contract Project
{
    struct Person {
        address addr;
        uint funds;
    }

    Person[] people;

    function getPeople(uint[] indexes)
        public
        returns (address[], uint[])
    {
        address[] memory addrs = new address[](indexes.length);
        uint[]    memory funds = new uint[](indexes.length);

        for (uint i = 0; i < indexes.length; i++) {
            Person storage person = people[indexes[i]];
            addrs[i] = person.addr;
            funds[i] = person.funds;
        }

        return (addrs, funds);
    }
}
