
pragma solidity 0.8.17;

contract Example{
  
    function f1() public pure returns(uint256) {
        return 531;
    }

    function f2() external  pure returns(uint256) {
        return 135;
    }

    function f3() internal pure returns(uint256) {
        return 123;
    }

    function f4() private pure returns(uint256) {
        return 321;
    }

}
