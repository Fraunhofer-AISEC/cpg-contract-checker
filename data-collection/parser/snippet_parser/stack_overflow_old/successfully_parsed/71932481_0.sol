    

pragma solidity ^0.8.0;



contract Banking {

    address public Beneficiary;
    uint256 public givenTime;

    constructor(address payable _Beneficiary, uint256 _givenTime) {
        require(_givenTime > block.timestamp); 
        Beneficiary = _Beneficiary;
        givenTime = _givenTime;
    }

    function Withdraw() public {
        require(block.timestamp >= givenTime);
        address(Beneficiary).transfer(address(this).balance);
    }
}
