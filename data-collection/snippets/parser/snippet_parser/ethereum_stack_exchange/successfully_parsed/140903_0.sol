contract checkMyEligibility {
    uint requiredAge;

    constructor(uint _requiredAge) {
        requiredAge = _requiredAge;
    }

    function checkAge(uint _age) public view {
        require(_age > requiredAge, "Minimum age should be 20 years");
        
    } 
}
