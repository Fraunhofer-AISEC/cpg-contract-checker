pragma solidity 0.5.1;

contract MyContract {
    Evidence[] public evidence;

    struct Evidence {
        string name;
        string location;
    }
    
    function addPerson(string memory name, string memory location) public {
        evidence.push(Evidence(name, location));
    }
}
