pragma solidity >=0.4.16 <0.9.0;

contract ERC20Token {
    string public name;
    mapping(address => uint) public balances;
    
    function mint() public {
        balances[tx.origin]++;
    }
}

contract MyContract {
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token)  {
        wallet = _wallet;
        token = _token;
    }
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
