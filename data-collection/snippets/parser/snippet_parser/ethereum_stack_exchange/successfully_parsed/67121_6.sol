contract Publisher {
    StorageController _storages;

    constructor(address storageControllerAddress) public {
        _storages = StorageController(storageControllerAddress);
    }

    function getStorage(uint index) public view returns(string memory, uint256, uint256, uint256, uint256, bool) {
        (string memory name, uint256 maxLength, uint256 rank, uint256 writingFee, uint256 sellPrice,bool nonpublic) = _storages.getStorageData(index);
        return (name, maxLength,rank,writingFee,sellPrice,nonpublic);
    }
}
