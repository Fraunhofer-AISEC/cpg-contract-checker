contract StackingPool {
    struct Staker {
        uint128 amount; 
        uint256 date; 
    }
    
    mapping(address => mapping(address => Staker)) public stakers;
}
