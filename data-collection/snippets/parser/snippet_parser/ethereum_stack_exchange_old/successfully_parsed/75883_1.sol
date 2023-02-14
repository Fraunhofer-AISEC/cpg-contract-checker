pragma solidity ^0.4.17;

contract StorageContract{

    struct User {
        string email;
        string userName;
    }

    mapping(address=>User) mappingToUser;

    address[] public ContractsAdresses;

    function savePersonalInfo(string Name, string Email, address Addr) public {
        mappingToUser[Addr].email = Email;
        mappingToUser[Addr].userName = Name;
        ContractsAdresses.push(Addr);
    }
}
