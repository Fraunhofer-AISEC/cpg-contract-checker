address[] public contracts;
 TokenFactory public newContract;

function createContract(uint _totalSupply, string _name, string _symbol, uint _decimal) payable returns(uint256 t) {
  newContract = new TokenFactory(_totalSupply, _name, _symbol, _decimal);
  contracts.push(newContract);
  return (contracts.length);
} 

function getContractsCount() constant returns (uint256 length) {
  return (contracts.length);
} 
