import './InnerContract.sol';

contract OuterContract {
    InnerContract pInnerContract;

    function func(uint256 val) external returns (uint256) {
        return pInnerContract.func(val) + 1;
    }
}
