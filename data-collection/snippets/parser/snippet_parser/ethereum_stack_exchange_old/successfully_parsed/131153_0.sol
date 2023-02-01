function getHarvestingData(address _batchNo) public returns (string memory farmerName1,string memory harvestAmount,string memory fertilizerUsed, string memory cropVariety) {
    
    (farmerName1, harvestAmount, fertilizerUsed, cropVariety) = supplyChainStorage.getHarvestingData(_batchNo);  
    return (farmerName1, harvestAmount, fertilizerUsed, cropVariety);
}
