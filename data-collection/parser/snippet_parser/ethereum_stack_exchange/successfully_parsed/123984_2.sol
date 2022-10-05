contract C is ERC1155, Ownable {
    using Strings for uint256;
    string public nameContract;
    uint256 public quantity;
    uint256 public mintPrice;

    constructor(
        string memory _name,
        string memory _icon,
        uint256 _quantity,
        uint256 _mintPrice
        ) public ERC1155() 
    {

    }
    
}
