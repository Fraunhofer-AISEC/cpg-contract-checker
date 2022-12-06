    
    pragma solidity >=0.6.6 <0.8.0;
    
    
    interface IUniswapV2Pair {
        event Approval(address indexed owner, address indexed spender, uint value);
        event Transfer(address indexed from, address indexed to, uint value);
        function transfer(address to, uint value) external returns (bool);
        function transferFrom(address from, address to, uint value) external returns (bool);
    }
    interface IERC20 {
        
        function transfer(address recipient, uint256 amount) external returns (bool);
        
        event Transfer(address indexed from, address indexed to, uint256 value);
        event Approval(address indexed owner, address indexed spender, uint256 value);
    }
    
    
     contract Flashswap {
        address public owner;
        address private wbnb;
      
        constructor() {
            owner = msg.sender;  
            wbnb = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
            }
    
        function transfer_bnb_to_wallet(uint256 _amount, address _dest) external{
            IERC20(wbnb).transfer(_dest,_amount);
        }
}
