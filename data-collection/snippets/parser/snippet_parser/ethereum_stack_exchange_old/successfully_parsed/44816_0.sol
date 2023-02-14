struct Product{
  bytes32[] ProductArray; 
}

mapping(string =>  MapDetails) ProductStructs;

function appendDetails(string pid,bytes32 details) payable returns(bool success){
ProductStructs[pid].ProductArray.push(details);
}
