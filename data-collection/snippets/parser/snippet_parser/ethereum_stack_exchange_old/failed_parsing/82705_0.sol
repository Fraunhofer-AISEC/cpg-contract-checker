
interface ERC20 {

  function allowance(address _owner, address _spender) constant       returns (uint remaining);
  function approve(address _spender, uint _value) returns (bool success);
  function balanceOf(address _owner) constant returns (uint balance);
  function transfer(address _to, uint _value) returns (bool success);
  function transferFrom(address _from, address _to, uint _value) returns (bool success);
}

...
    function multiERC20Transfer(address _token, address[] _addresses, uint[] _amounts)
      public
    {
        for(uint256 i=0;i<_addresses.length;i++){
            ERC20(_token).transfer(_addresses[i], _amounts[i]);
        }
    }

