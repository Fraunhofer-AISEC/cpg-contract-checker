contract Base {
    
    function f() external view returns (uint256); 
}

contract Derived is Base {
    uint256 public f;
}
