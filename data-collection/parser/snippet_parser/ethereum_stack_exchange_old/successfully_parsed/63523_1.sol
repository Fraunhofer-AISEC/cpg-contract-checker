pragma solidity>0.4.99<0.6.0;

contract InsuranceClaimFactory{
    address public claimer;
   
    InsuranceClaim[] public deployedInsuranceClaim;
    function createInsuranceClaim () public {
        InsuranceClaim newInsuranceClaim = new InsuranceClaim(msg.sender);
        deployedInsuranceClaim.push(address(newInsuranceClaim));
    }

    function getDeployedInsuranceClaims () public view returns (InsuranceClaim[] memory){
        return deployedInsuranceClaim;
    }
}
