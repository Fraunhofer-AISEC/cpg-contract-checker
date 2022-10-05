pragma solidity ^0.4.18;
contract InnerContract {
    function func(uint256 val) external returns (uint256) {
    }
}

contract OuterContract is InnerContract{
    InnerContract pInnerContract = InnerContract(0xdc04977a2078c8ffdf086d618d1f961b6c546222);
   function func(uint256 val) external returns (uint256) {
        return  pInnerContract.func(val) + 1;
    }
}
