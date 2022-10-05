
pragma solidity ^0.8.7;

contract Timer{

    uint256 public constant intialSuply = 1000;
    uint256 private totalSupply;
    address public wallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public owner;
    mapping(address => uint) public balances;
    uint256 public constant SECONDS_IN_A_MONTH = 2_628_288;
    uint256 public constant SECONDS_IN_A_YEAR = 31_536_000;
    uint256 public lastUpdated;
    uint256 public immutable initialTimestamp;
    
    constructor(){
        owner = msg.sender;
        
        balances[wallet] = 1000;
        
        lastUpdated = block.timestamp;
        initialTimestamp = block.timestamp;
    }

    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }

    function unlock5Percent() public onlyOwner {

        
        
        if(block.timestamp - initialTimestamp >= SECONDS_IN_A_YEAR) {
            uint256 lockedFunds = balances[wallet];
            balances[wallet] = 0;
            balances[address(this)] = lockedFunds;
            totalSupply += lockedFunds;
        }

        
        
        
        else if(block.timestamp - lastUpdated >= SECONDS_IN_A_MONTH) {

            
            
            
            
            uint256 fivePercentage = balances[wallet] / 20;

            
            balances[wallet] -= fivePercentage;

            
            balances[address(this)] += fivePercentage;

            
            
            totalSupply += fivePercentage;

            
            lastUpdated = block.timestamp;
        }
        
    }

    
    function transfer(address to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough balance");
        balances[msg.sender] -= _amount;
        balances[to] += _amount;
    }

    
    function transferTo(address to, uint256 _amount) public onlyOwner {
        require(balances[address(this)] >= _amount, "Not enough balance");
        balances[address(this)] -= _amount;
        balances[to] += _amount;
    }
    
}
