
interface ERC20Token {
    function totalSupply() external view returns (uint256 _totalSupply);
    function balanceOf(address _owner) external view returns (uint256 _balance);
    function transfer(address _to, uint256 _value) external returns (bool _success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool _success);
    function approve(address _spender, uint256 _value) external returns (bool _success);
    function allowance(address _owner, address _spender) external view returns (uint256 _remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract CrowdSale {

    ERC20Token token;

    constructor (uint256 _hivePerEther, address _wallet, address _token, uint256 _openingTime, uint256 _closingTime) public {
        token = ERC20Token(_token);
        ...
    }

    function getTokenBalance(address _addr) external view returns (uint256 _balance) {
         _balance = token.balanceOf(_addr);
    }
}
