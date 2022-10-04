import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract MyERC721Token is ERC721Token {

  function createNewToken(...) {
    _mint(msg.sender, index);
  }
}

