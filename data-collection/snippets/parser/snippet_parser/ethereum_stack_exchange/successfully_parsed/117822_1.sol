pragma solidity >=0.7.0;
contract Migrations{
    address public owner;
    uint public last_completed_migration;
    constructor() {
        owner = msg.sender;
    }
    modifier restrected() {
        require(msg.sender == owner);
        _;
    }
    function setCompleted(uint completed)public restrected {
        last_completed_migration = completed;
    }
    function upgarde(address newAdress)public restrected {
        Migrations upgraded = Migrations(newAdress);
        upgraded.setCompleted(last_completed_migration);

    }
}
