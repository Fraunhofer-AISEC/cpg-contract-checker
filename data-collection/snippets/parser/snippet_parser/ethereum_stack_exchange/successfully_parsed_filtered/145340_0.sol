
pragma solidity ^0.8.7;



interface IERC20 {
    
    function totalSupply() external view returns (uint256);

    
    function balanceOf(address account) external view returns (uint256);

    
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    
    function approve(address spender, uint256 amount) external returns (bool);

    
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract Test{
     IERC20 public tokenAddress;
    constructor(address _tokenAddress) {
        
       
         tokenAddress = IERC20(_tokenAddress);
    }

   function checkSupply() payable public returns(uint){
        
        return tokenAddress.totalSupply();
        

        
   }
}
