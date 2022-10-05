pragma solidity ^0.4.18;

contract ERC20Interface {
    function transfer(address to, uint tokens) public returns (bool success);

}

contract FixedSupplyToken is ERC20Interface {

    function transferAnyERC20Token(address tokenAddress, uint tokens) public  returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(tokenAddress, tokens);
    }
}
