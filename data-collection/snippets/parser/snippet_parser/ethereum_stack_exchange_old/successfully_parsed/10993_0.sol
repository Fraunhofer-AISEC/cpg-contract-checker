function getInsurance(uint index) constant returns (string, InsuranceStatus) {
    Insurance insurance = insurances[insuranceList[index]];
    return (insurance.name, insurance.status);
}

function getInsurance(address insuranceAddress) constant returns (string, InsuranceStatus) {
    Insurance insurance = insurances[insuranceAddress];
    return (insurance.name, insurance.status);
}
