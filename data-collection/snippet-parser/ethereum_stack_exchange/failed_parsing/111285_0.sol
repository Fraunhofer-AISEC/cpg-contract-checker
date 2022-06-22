pragma solidity >=0.6.0 <0.8.0;

interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);  
  
    function transfer(address recipient, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
    
}


contract MyContract {

    address MyToken = 0x............;
    address MyAccount2 = 0x............;

    function Myfunction(uint256 amount) public 
    {

        require(amount > 0, 'zero amount');
        
        IERC20(MyToken).approve(msg.sender, amount); 
        IERC20(MyToken).transfer(address(this), amount); 
        IERC20(MyToken).allowance(msg.sender, address(this));
        IERC20(MyToken).approve(address(this), amount); 
        IERC20(MyToken).transferFrom(address(this), MyAccount2, amount);

    }
}
