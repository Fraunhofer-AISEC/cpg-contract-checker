    contract Token is ERC20{
....
 function mint(address addr, uint256 amount) external {
       _mint(addr, amount);
 }
....

}

struct Param{
    address owner;
    uint256 amount;
}

contract Test{
    ....
    function callMint(address tokenAddress, Param param) external {
         Token(tokenAddress).mint(param.owner, param.amount);
    }
    ....
}
