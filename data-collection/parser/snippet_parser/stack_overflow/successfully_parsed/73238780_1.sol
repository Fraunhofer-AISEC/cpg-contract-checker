contract myContract{

  string constant errMsg = "Test failed";

  function myFunc() external {
    require( [CONDITION_A] , errMsg );
    require( [CONDITION_B] , errMsg );
    require( [CONDITION_C] , errMsg );
    require( [CONDITION_D] , errMsg );
    [ACTUAL_OPERATIONS]
  }

}
