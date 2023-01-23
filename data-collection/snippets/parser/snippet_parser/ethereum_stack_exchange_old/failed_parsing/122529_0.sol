pragma solidity ^0.6.12;


interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract mycontract {
    
    
    string public name = "DefiBank";
    
    
    address public LINK;
    address public bankToken;


    address[] public stakers;
    mapping(address => uint) public stakingBalance;
    mapping(address => bool) public hasStaked;
    mapping(address => bool) public isStaking;


    
    
    constructor() public {
        LINK = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709;
        bankToken = 0x5A39644Axxxxxxxxxxxxxxx849cBf102be;

    }


    
    
    function stakeTokens(uint _amount) public {

        
        IERC20(LINK).transferFrom(msg.sender, address(this), _amount);

        
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        
        if(!hasStaked[msg.sender]) {
            stakers.push(msg.sender);
        }

        
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

        
    
     function unstakeTokens() public {

        
        uint balance = stakingBalance[msg.sender];
    
        
        require(balance > 0, "staking balance can not be 0");
    
        
        IERC20(usdc).transfer(msg.sender, balance);
    
        
        stakingBalance[msg.sender] = 0;
    
        
        isStaking[msg.sender] = false;

} 


    
    
    function issueInterestToken() public {
        for (uint i=0; i<stakers.length; i++) {
            address recipient = stakers[i];
            uint balance = stakingBalance[recipient];
            
    
            
            if(balance >0 ) {
                IERC20(bankToken).transfer(recipient, balance);
                
            }
            
        }
        
    }

    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
} 
