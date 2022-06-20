contract StorageController {
    struct Storage {
        string name;
        uint256 maxLength;
        uint256 rank;
        uint256 writingFee;
        uint256 sellPrice;
        bool nonpublic;
    }

    mapping(uint256 => Storage) public storages;
    uint storageCount = 0;

    constructor() public {
        Storage memory newStorage = Storage({
            name: 'aaa',
            maxLength: 11,
            rank: 12,
            writingFee: 13,
            sellPrice: 14,
            nonpublic: false
        });

        storages[storageCount++] = newStorage;
    }

    function getStorageData(uint256 i) external view 
        returns(string memory name, uint256 maxLength, uint256 rank, uint256 writingFee, uint256 sellPrice, bool nonpublic) {
        return (storages[i].name, storages[i].maxLength,storages[i].rank,storages[i].writingFee,storages[i].sellPrice,storages[i].nonpublic);
    }
}
