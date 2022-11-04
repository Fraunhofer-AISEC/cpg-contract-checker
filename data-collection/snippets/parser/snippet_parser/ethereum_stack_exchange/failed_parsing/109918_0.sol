pragma solidity 0.5.16;

interface IBEP20 {
        function transfer(address _to, uint256 _amount) external returns (bool);
    }

contract Token_lock {
    
    address public owner;
    
    mapping (address => uint256) private _balances;
    mapping (address => uint256) private _balanceOf;
    bool public transferable = false;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor() public {
        owner = msg.sender;
     }
    
    modifier checkBlock() {
        if(owner != msg.sender)
        {
         require(block.number > 18000000 , 'Your Tokens are locked!');
         _;
        }
    } 
    
    function balanceOf(address account) internal view returns (uint256) {
        return _balances[account];
    }
      
    function transfer(address _to, uint _value) public checkBlock() returns(bool success) {
        
        IBEP20 tokenContract = IBEP20(0x059...);
        return tokenContract.transfer(_to, _value);
    }
    
}
