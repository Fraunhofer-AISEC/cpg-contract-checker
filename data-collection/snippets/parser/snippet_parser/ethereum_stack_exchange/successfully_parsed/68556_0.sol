uint public countContract;
address[] public deployedContracts;

function createContract(string memory _name) 
public{       
    address newContract = new Contract2(countContract++, _name);
    deployedContracts.push(newContract);
 }
