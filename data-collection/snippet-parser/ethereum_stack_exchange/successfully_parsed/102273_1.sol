pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Color is ERC721Enumerable {
    
    string[] public colors;
    mapping(string => bool) _colorMintedAlready;

    constructor() ERC721('Color', 'CLRS') public{
    }

    function mint(string memory _color) public{
        require(!_colorMintedAlready[_color]);
        colors.push(_color);
        uint _id = colors.length;
        _safeMint(msg.sender, _id);
        _colorMintedAlready[_color] = true;
    }

    function tokensOfOwner(address _owner) external view returns(uint256[] memory ownerTokens) {
        uint256 tokenCount = balanceOf(_owner);

        if (tokenCount == 0) {
            
            return new uint256[](0);
        } else {
            uint256[] memory result = new uint256[](tokenCount);
            uint256 totalCats = totalSupply();
            uint256 resultIndex = 0;

            
            
            uint256 catId;

            for (catId = 1; catId <= totalCats; catId++) {
                if (ownerOf(catId) == _owner) {
                    result[resultIndex] = catId;
                    resultIndex++;
                }
            }

            return result;
        }
    }
}
