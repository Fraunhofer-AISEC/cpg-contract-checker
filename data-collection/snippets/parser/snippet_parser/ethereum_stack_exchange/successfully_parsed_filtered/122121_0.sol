pragma solidity ^0.8.0;

contract Token {

    mapping(address => uint256) AccountsBalances; 
    string public constant TokenName = "NewToken";
    string public constant TokenSymbol = "ALPH";
    uint public  MaxTokens = 1000000000;
    uint256 public constant decimals = 18;

    function transfer(address _to,uint256 _amount) virtual payable public  returns (bool);
    function transferFrom(address _from , address _to ,uint _amount) virtual payable public returns (bool);
    function AllowToSpend( address _spender , uint256 _allowanceAmount) virtual public returns (bool);
    function CheckMyAllowance(address _walletAddress) virtual public view returns (uint256);
    function BalanceOfWallet(address _walletAddress) virtual public view returns (uint256);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event ApprovalToSpend(address indexed _owner, address indexed _spender, uint256 _value);
}


contract StandardToken is Token{

    
    mapping (address => mapping (address => uint256)) Allowed;


    function transfer(address _to, uint256 _amount)override payable public returns (bool){
        if(AccountsBalances[msg.sender] >= _amount && _amount > 0 && msg.sender != _to)
        {
            AccountsBalances[msg.sender] -= _amount;
            AccountsBalances[_to] += _amount;
            Transfer(msg.sender, _to, _amount);
        } else return false;
    }


    function transferFrom(address _TransferFrom , address _TransferTo , uint256 _amount)override payable public returns (bool)
    {
        if(CheckMyAllowance(_TransferFrom) >= _amount && AccountsBalances[_TransferFrom] >= _amount && _amount > 0)
        {
            AccountsBalances[_TransferFrom] -= _amount;
            Allowed[_TransferFrom][msg.sender] -= _amount;
            AccountsBalances[_TransferTo] += _amount;
            Transfer(_TransferFrom,_TransferTo,_amount);
        }else return false;
    }

    function AllowToSpend(address _spender,uint256 _allowanceAmount) override public returns (bool)
    {
        Allowed[msg.sender][_spender] = _allowanceAmount;
        ApprovalToSpend(msg.sender,_spender,_allowanceAmount);
        return true;
    }

    function CheckMyAllowance(address _walletAddress) override public view returns (uint256)
    {
        return Allowed[_walletAddress][msg.sender];
    }


    function BalanceOfWallet(address _walletAddress)override public view returns (uint256)
    {
        require(CheckMyAllowance(_walletAddress) > 0, "You have no allowance on this account and cannot see balance");
        return AccountsBalances[_walletAddress];
    }
}
