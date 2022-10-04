contract Factory {
    address[] newContracts;

    function createContract (bytes32 name) {
        address newContract = new Contract(name);
        newContracts.push(newContract);
    } 
}

contract Contract {
    bytes32 public Name;

    function Contract (bytes32 name) {
        Name = name;
    }
}
