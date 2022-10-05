
contract ERC20 {
    function transfer(address _to, uint256 _value)public returns(bool);
    function balanceOf(address tokenOwner)public view returns(uint balance);
    function transferFrom(address from, address to, uint tokens)public returns(bool success);
}

contract SimpleAirdrop {

    ERC20 public token;
    uint256 amount = 1000 * 10**18 

    function SimpleAirdrop(address _tokenAddr) public {
        token = ERC20(_tokenAddr);
    }

    function getAirdrop() public {
        token.transfer(msg.sender, amount); 
    }
}
