
pragma solidity ^0.7.0;
import "../openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";

contract ERC20Token is IERC20 {
    function transfer(address to, uint256 tokens) public override returns (bool) {
        balances[msg.sender] = SafeMath.sub(balances[msg.sender], tokens);
        balances[to] = SafeMath.add(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
}
