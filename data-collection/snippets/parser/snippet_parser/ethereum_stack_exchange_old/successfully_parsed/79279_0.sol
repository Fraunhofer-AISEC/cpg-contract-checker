pragma solidity 0.5.4;
contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() payable public {
        balances[msg.sender] += msg.value;
    }
}
contract MyContract {
    address public token;

    address payable wallet;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    function() external payable{
       buyToken();
    }
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
