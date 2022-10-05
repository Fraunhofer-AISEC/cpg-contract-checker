contract Factory {
    uint public counter;
    bytes32[] public Names;
    address[] public newContracts;

        function setCounter(uint v) {counter = v; }
    function createContract (bytes32 name) {
        counter++;
        address newContract = new Contract(name);
        newContracts.push(newContract);
    }

    function getName (uint i) {
        counter++;
        Contract con = Contract(newContracts[i]);
        Names[i] = con.Name();
    }
}

contract Contract {
    bytes32 public Name;

    function Contract (bytes32 name) {
        Name = name;
    }    
}
