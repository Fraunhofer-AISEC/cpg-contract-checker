interface CheckAge{
    function setAge() external view returns (uint256);    
}

contract Base {
uint256 Age;
function getAge() internal returns (uint256) { 
    return Age;
}
function setAge(uint256 b) internal pure returns (uint256){
    uint256 Age = b;
    return Age;
}
}

contract Derived is Base {
constructor ()  public {
CheckAge;
uint256 Age;
function getAge() external view returns (uint256);
function setAge(uint256 b) internal view returns (uint256);
}
}
