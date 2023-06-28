interface IERC2981 {
 
    function customRoyaltyInfo(uint256 tokenId, uint256 salePrice)
        external
        view
        returns (address[] memory receivers, uint256 royaltyAmount);

    function royaltyInfo(uint256 tokenId, uint256 salePrice)
        external
        view
        returns (address receiver, uint256 royaltyAmount);
}

contract ReadRoyalty {
    function getCustomRoyalty(IERC2981 addr, uint tokenId, uint price) {
        
        

        (address[] memory receivers, uint256 royaltyAmount) = addr.customRoyaltyInfo(tokenId, price);
    }
}

