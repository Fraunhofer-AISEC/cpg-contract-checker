contract Bbum is ERC1155, Ownable {
    uint256 public constant GOLD = 0;
    uint256 public constant THORS_HAMMER = 1;
    uint256 tokenCounter = 0;
    mapping(uint256 => string) private _uris;


constructor()
    ERC1155(
        "https://gateway.pinata.cloud/ipfs/QmWAcb89p9kiELQQ36px9PSErVE97FVqSTBNpCWtB5WzxB/{id}.json"
    )
{
    _mint(msg.sender, GOLD, 5, "");
    _mint(msg.sender, THORS_HAMMER, 3, "");
    tokenCounter = 1;
}

function setURI(string memory newuri) public onlyOwner {
    _setURI(newuri);
}

function mint(
    address account,
    uint256 id,
    uint256 amount,
    bytes memory data
) public onlyOwner {
    _mint(account, id, amount, data);
}

function mintBatch(
    address to,
    uint256[] memory ids,
    uint256[] memory amounts,
    bytes memory data
) public onlyOwner {
    _mintBatch(to, ids, amounts, data);
}
}