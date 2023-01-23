  pragma solidity 0.8.12;

contract GetWalletDemo {

 uint256 public tokenCounter ;
mapping(address => uint256) public balances;

mapping(uint256 => address) public _tokenOwner;


function balanceOf(address _owner) public view returns (uint256) {    return balances[_owner];}
function ownerOf(uint256 tokenId) public view returns (address) {    address owner = _tokenOwner[tokenId];    require(owner != address(0));    return owner;}



   function ownerOfTokenIds(address tokenOwner) external view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](balanceOf(tokenOwner));
        uint256 counter = 0;
        for (uint256 i = 0; i < counter; i++) {
            if (ownerOf(i) == tokenOwner) {
                result[counter] = i;
                counter++;
            }
        }
        return result;
    }


}
