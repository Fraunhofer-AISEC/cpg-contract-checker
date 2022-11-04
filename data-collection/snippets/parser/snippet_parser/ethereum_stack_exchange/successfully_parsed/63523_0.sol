pragma solidity >=0.4.22 <0.6.0

contract InsuranceClaimFactory{
    address public claimer;
    address[] public deployedInsuranceClaim;
    function createInsuranceClaim () public {
        address newInsuranceClaim = new InsuranceClaim(msg.sender);
        deployedInsuranceClaim.push(newInsuranceClaim);
    }

    function getDeployedInsuranceClaims () public view returns (address[] memory){
        return deployedInsuranceClaim;
    }
}
