
function getContractData() public view returns(string memory data){
  ContractB instance = ContractB(<address where ContractB is available>));
  return instance.getData();
}


function getData() public view returns(string memory data){
  return "Hello";
}
