contract checkMyEligibility {
    error Underaged(uint256 givenAge, uint256 requiredAge);

    uint requiredAge;

    constructor(uint _requiredAge) {
       requiredAge = _requiredAge;
    }

    function checkAge(uint _age) public view {
      if (_age < requiredAge){
         revert Underaged({
             givenAge: _age,
             requiredAge: requiredAge
          });
        }
    }
}
