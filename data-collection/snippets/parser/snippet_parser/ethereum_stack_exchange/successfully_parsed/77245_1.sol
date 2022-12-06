
interface InterestRateModel {
  function getBorrowRate(uint cash, uint borrows, uint reserves) external view returns (uint, uint);
  function isInterestRateModel() external view returns (bool);
}

contract Caller {
  
  InterestRateModel private interesetRateModel =
    InterestRateModel (0xBAE04CbF96391086dC643e842b517734E214D698);

  uint public borrowRate = 0;

  
  function fetchAndSaveBorrowRate () public {
    uint status;
    uint rate;

    
    (status, rate) = interesetRateModel.getBorrowRate (1, 2, 3);

    
    if (status == 0) borrowRate = rate;
  }
}
