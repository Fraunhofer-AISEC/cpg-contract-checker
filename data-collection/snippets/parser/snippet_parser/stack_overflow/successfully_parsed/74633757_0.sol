contract FNFToken is ERC20, ERC20Burnable, Ownable,     IERC721Receiver
 {
    constructor() ERC20("FNFToken", "FNT") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
