function addBeneficiary(address addr, uint weight) onlyOwner {
    beneficiaries.push(Beneficiary({
        addr: addr,
        weight: weight
    }));
  }
