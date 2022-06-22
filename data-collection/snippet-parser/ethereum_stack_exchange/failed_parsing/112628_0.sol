interface IERC20 {
    function totalSupply() external view returns (uint256);
}

contract SomePublicContract {
    function somePublicMethod(IERC20 someToken) public 
    {
        someToken.totalSupply();
    };
}
