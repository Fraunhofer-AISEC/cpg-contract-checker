
pragma solidity 0.8.11;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract EXAMPLE is ERC721 {
    string[] public assets;
    constructor() ERC721("Example", "EXMP") {
        assets = ["sword","arrow","shield","cape"];
    }
    function attack() public view returns(uint256 damage){
        string[] memory weapons = assets[0:2];
    }
}
