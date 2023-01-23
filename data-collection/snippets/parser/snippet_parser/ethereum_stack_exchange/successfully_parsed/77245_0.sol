pragma solidity ^0.5.8;

contract YourContract {
    
    InterestRateModel interest_rate_model;

    constructor(address _interest_rate_model_contract_address) public {
        interest_rate_model = InterestRateModel(_interest_rate_model_contract_address);
    }

    function getInterestRateModelBorrowRate() public view returns (uint, uint) {
        return interest_rate_model.getBorrowRate(1, 2, 3);
    }
}

interface InterestRateModel {
    function getBorrowRate(uint cash, uint borrows, uint reserves) external view returns (uint, uint);
    function isInterestRateModel() external view returns (bool);
}
