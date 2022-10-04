pragma solidity 0.4.24;


contract ERC20Test
{

    mapping(address => uint256) balances;
    uint256 totalSupply_ = 100;
    event Transfer(address from, address to, uint256 value);

    function () payable 
    {
        return;
    }

    function transferETHToERC20(ERC20Test token, uint256 value) public
    {
        token.transfer(value); 
    }

    function transferTokentoERC20(ERC20Test token,address _to, uint amount) public 
    {
        token.transfer(_to,amount); 
    }


    function returnBalance() public view returns (uint256)
    {
        return this.balance;

    }

    function totalSupply() public view returns (uint256) 
    {
    return totalSupply_;
    }

    constructor ()
    {
        balances[msg.sender] = totalSupply_;
    }
    function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender]- _value;
    balances[_to] = balances[_to] + _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
    }

    function balanceOf(address _owner) public view  returns (uint256)
    {
        return balances[_owner];
    }

}
