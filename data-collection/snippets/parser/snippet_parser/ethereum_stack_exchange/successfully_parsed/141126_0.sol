contract MintNFT_ERC1155 is ERC1155, Ownable, ERC1155Supply {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint256 public EditionPrice = 0.0001 ether;
    
    string public name;
    string public symbol;
    constructor(string memory NftName, string memory NftSymbol) ERC1155("") {
        name = NftName;
        symbol = NftSymbol;
    }

    function mint(
        address account,
        uint256 edition,
        string memory uri
    ) public payable {
         _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        
        require(edition > 0, "Edition count cannot be 0");
        require(msg.sender.balance >= EditionPrice * edition, "you don't have enough ether to perform this transaction");
        _mint(account, newItemId, edition, "");
        _setURI(uri);
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory editions,
        bytes memory data
    ) internal override(ERC1155, ERC1155Supply) {
        super._beforeTokenTransfer(operator, from, to, ids, editions, data);
    }
}
