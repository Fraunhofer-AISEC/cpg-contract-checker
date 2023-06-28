interface IMarketplace {
    function addMerchContract(ContractA _merch, string memory _artistName, address _wallett) external;
}

contract ContractB {

    ContractA[] merchStorage;
    address marketplace;

    constructor(address _marketplace) {
        marketplace = _marketplace;
    } 

    mapping(address => uint256) creatorToMerch;

    function createMerch(string memory _name, string memory _symbol) public {
         ContractA merch = new ContractA(_name, _symbol, marketplace);
         merchStorage.push(merch);
         uint merchStorageId = merchStorage.length - 1;
         creatorToMerch[msg.sender] = merchStorageId;
         address merchContractAddress = address(merch);
         IMarketplace(marketplace).addMerchContract(merch, merch.name(), msg.sender);
    }

}