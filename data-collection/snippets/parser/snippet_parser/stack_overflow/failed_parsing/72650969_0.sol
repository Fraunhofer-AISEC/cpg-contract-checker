interface IERC20 {...} 

contract AnotherContract {

function approve(address _spender, uint256 _amount) public returns(bool) {
    return IERC20(MyToken).approve(_spender, _amount);
}
