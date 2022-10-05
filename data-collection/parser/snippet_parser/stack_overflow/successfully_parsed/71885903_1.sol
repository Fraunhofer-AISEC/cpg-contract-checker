
pragma solidity 0.8.13;

contract TestEnum {
    enum TokenType{ FUNGIBLE, NON_FUNGIBLE, NULL }
    address public owner;

    struct ParentTokenDetails{
        TokenType _tokenType;
        address _tokenOwner;
        ChildTokenDetails[] children;
    }
    struct ChildTokenDetails{
        TokenType _tokenType;
        address _tokenOwner;
        bool _locked;
    }
    mapping(uint256 => ParentTokenDetails) public TokenEnums;

    constructor(){
        owner = msg.sender;
    }

    
    function mintNonFungibleTokenEnum(uint256 tokenID)
        public
        returns (uint256)
    {
        uint256 newItemId = 1;
        ParentTokenDetails._tokenType = TokenType.NON_FUNGIBLE;
        ParentTokenDetails._tokenOwner = msg.sender;
        ParentTokenDetails.children = ChildTokenDetails([TokenType.NULL, msg.sender, false]);
        TokenEnums[newItemId] = ParentTokenDetails;

        return newItemId;
}
}