contract ERC20 {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract my_contract {
    ERC20 _token;

    function my_contract(address tokenAddress) public {
        _token = ERC20(tokenAddress);
    }

    function my_function(address to, uint amount) public {
        

        _token.transferFrom(msg.sender, to, amount);
    }
}
