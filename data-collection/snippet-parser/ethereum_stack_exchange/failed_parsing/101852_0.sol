contract MasterChef {

    struct PoolInfo {
        IERC20 lpToken; 
        uint256 allocPoint; 
        uint256 lastRewardBlock; 
        uint256 accSushiPerShare; 
    }
    

contract AnotherContract {

    function anotherFunction() public {
        uint256 allocPoint = masterChef.poolInfo(0).allocPoint;
    }
}
