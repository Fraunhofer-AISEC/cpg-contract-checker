contract Factory {
mapping(uint256 => Contract) deployedContracts;
uint256 numContracts;
function Factory(){
    numContracts = 0;
}

function createContract (uint32 name) returns (address){
    deployedContracts[numContracts] = new Contract(name);
    numContracts++;
    return deployedContracts[numContracts];
}}
