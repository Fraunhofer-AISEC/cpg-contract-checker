interface IERC20 {
    
    function balanceOf(address account) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract BuyTokens {
    IERC20 token;

    function withdraw(address beneficiary) public {

        uint256 value = balanceOf(_admin).mul(5).div(100);
        require(balanceOf(_admin) > value);
        token.transfer(beneficiary, value);
    }

}
