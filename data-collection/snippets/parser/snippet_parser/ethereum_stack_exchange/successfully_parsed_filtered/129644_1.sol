import "./MyToken.sol";

contract MyBankTest {

    MyToken public token;

    mapping(address => uint) public balances; 

    constructor (address _token) {
        token = MyToken(_token); 
    }

    function stake(uint _amount) public {
        token.transferFrom(msg.sender, address(this), _amount);
        balances[msg.sender] += _amount;
    }
}
