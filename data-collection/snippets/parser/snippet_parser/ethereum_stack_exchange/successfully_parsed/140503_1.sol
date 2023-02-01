contract MyContract is ERC20{

    constructor() ERC20("MyErc20", "ABC") {
    }

    function sellYourNft (address nftContractAddress, uint id) public {
        ERC721(nftContractAddress).safeTransferFrom(msg.sender, address(this), id);
        ERC20(address(this)).transferFrom(address(this), msg.sender, 39);
    } 

}
