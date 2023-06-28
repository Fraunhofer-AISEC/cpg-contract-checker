pragma solidity = 0.8.11;

import 'contracts/test/IOtherContract.sol';

contract MainContract {
    address public immutable otherContract;

    constructor(address _otherContract) public {
        otherContract = _otherContract;
    }

    function callOtherContract(address wallet) external returns (address pair){
        pair = IOtherContract(otherContract).checkAddress(wallet);
        return pair;
    }
}
