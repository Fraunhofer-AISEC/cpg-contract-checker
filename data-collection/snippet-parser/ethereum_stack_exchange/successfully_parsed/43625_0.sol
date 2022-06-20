pragma solidity ^0.4.21;
import "https://github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract MyToken is MintableToken {
  string public constant name = "MyToken";
  string public constant symbol = "MyToken";
  uint public constant decimals = 18;
}
