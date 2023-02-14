pragma solidity ^0.4.18;

contract ERC20 {

    address public tokenAddr = (my token address);
    ERC20 public token;

    function transfer(address _to, uint256 _value) public returns(bool);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function approve(address spender, uint256 value) public returns (bool);
    function transferFrom(address from, address to, uint256 value) public returns (bool);
    function allowance(address owner, address spender) public view returns (uint256);
}

contract SAY is ERC20 {

    string word = 'Something';

    function SAYSOMETHING() public returns(string)  {

        token.approve(msg.sender, 500);
        token.transferFrom(msg.sender,this, 500);
        return word;
    }

}
