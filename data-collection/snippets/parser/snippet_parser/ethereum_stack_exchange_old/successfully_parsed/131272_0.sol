
pragma solidity ^0.8.7;

import "./MyToken.sol";

contract marketPlace 
{
    struct Item {
        address tokenAddress;
        uint256 index;
        uint256 tokenID;
        uint256 price;
        address payable owner;
        string url;
    }
    
    Item[] public items;

    mapping(address => mapping(uint256 => bool)) listedTokens;

    function listForSale(
        uint256 _tokenID,
        uint256 _price,
        uint256 _tokenAddress,
        string memory _url
    ) public {
        uint256 index = items.length;
        MyToken ERC721 = MyToken(_tokenAddress);
        require(
            msg.sender == ERC721.ownerOf(_tokenID),
            "MarketPlace:  Sender is not the owner of the token."
        );
        require(
            !listedTokens[_tokenAddress][_tokenID],
            "MarketPlace:  The token is already listed."
        );
        require(
            address(this) == ERC721.getApproved(_tokenID) ||
            ERC721.isApprovedForAll(msg.sender, Address(this)),
            "MarketPlace:  NFTMarketPlace was not provided approval to transfer."
        );
        items.push(
            Item(
                index,
                _tokenAddress,
                _tokenID,
                _price,
                payable(msg.sender),
                _url
            )
        );

        listedTokens[_tokenAddress][_tokenID] = true;
}
    function buyNFT() public payable returns (uint256 _index) 
    {
        require(
            msg.value == items[_index].price,
            "MarketPlace:  Please pay the amount equal to the price."
        );

   MyToken ERC721 = MyToken(items[_index].tokenAddress);
   ERC721.safeTransferFrom(
       items[_index].owner,
       msg.sender,
       items[_index].tokenID
   );
    items[_index].owner.transfer(msg.value);
    listedTokens[items[_index].tokenAddress][items[_index].tokenID] = false;
    for (uint256 i = _index; i < items.length - 1; i++) {
        items[i] = items[i + 1];
        items[i].index -= 1;
    }
    items.pop();
    }
    function getItemsList() external view returns (Item[] memory) {
        return items;
    }
    function totalItems() external view returns (uint256) {
        return items.length;
    }

}
