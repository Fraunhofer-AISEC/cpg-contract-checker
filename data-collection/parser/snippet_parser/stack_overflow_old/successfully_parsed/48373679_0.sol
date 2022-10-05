
struct Data {
    bytes32 hashFile;

}


function addData(bytes32 _hashFile) {
    require(_hashFile > 0);

    ContractData memory contractData;
    contractData.hashFile = _hashFile;
    contractData.contractState = ContractState.Created;

    contracts[Id] = contractData;
}


function getDocumentHash() constant external returns (bytes32) {
    return contracts[_contractId].hashFile;
}
