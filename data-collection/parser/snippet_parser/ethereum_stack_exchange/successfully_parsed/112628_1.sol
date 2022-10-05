interface MyIERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256); 
}

interface ISomePublicContract {
    
    function somePublicMethod(MyIERC20 someToken) external; 
}

contract MyContract {
    function myMethod() public {
      MyIERC20 token = MyIERC20(tokenAddress);
      
      ISomePublicContract(addressOfDeployedContract).somePublicMethod(token);
    }
}
