uint public countContract;
Contract2[] public deployedContracts;

function createContract(string memory _name) 
    public
 {       
    Contract2 newContract = new Contract2(countContract++, _name);
    deployedContracts.push(newContract);
 }
