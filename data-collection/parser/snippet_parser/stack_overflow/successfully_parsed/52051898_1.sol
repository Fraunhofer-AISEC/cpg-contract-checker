interface ERC20 {
    function transferFrom(address _from, address _to, uint 
_value) public returns (bool);
    function approve(address _spender, uint _value) public 
returns (bool);
    function allowance(address _owner, address _spender) public 
constant returns (uint);
    event Approval(address indexed _owner, address indexed 
_spender, uint _value);
}

interface ERC223 {
    function transfer(address _to, uint _value, bytes _data) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
}