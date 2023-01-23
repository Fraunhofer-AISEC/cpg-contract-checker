contract SimpleSmartAsset is Mortal {

  uint usagePrice;
  Beneficiary[] beneficiaries;
  uint totalWeight; 

  event AssetCreated(uint _usagePrice,
                     address[] addresses,
                     uint[] weights);

  function SimpleSmartAsset(uint _usagePrice,
                            address[] addresses,
                            uint[] weights) {
    owner = msg.sender;
    usagePrice = _usagePrice;

    uint beneficiaryCount = addresses.length;
    for (uint i = 0; i < beneficiaryCount; i++) {

      uint weight = weights[i];

      addBeneficiary(addresses[i], weight);
      totalWeight += weight;
    }

    AssetCreated(_usagePrice, addresses, weights);
  }

  function getUsagePrice() constant returns (uint) {
    return usagePrice;
  }

  event BeneficiaryPaid(address addr, uint amount);

  function pay() payable onlyOwner {
    require(msg.value >= usagePrice);

    uint beneficiaryCount = beneficiaries.length;
    for (uint i = 0; i < beneficiaryCount; i++) {

      Beneficiary memory beneficiary = beneficiaries[i];

      uint weight = beneficiary.weight;
      address addr = beneficiary.addr;

      uint amount = (weight * usagePrice) / totalWeight;

      uint GAS_LIMIT = 4000000;
      addr.transfer.gas(GAS_LIMIT)(amount);
      BeneficiaryPaid(addr, amount);
    }
  }

  struct Beneficiary {
    address addr;
    uint weight;
  }

  function addBeneficiary(address addr, uint weight) onlyOwner {
    beneficiaries.push(Beneficiary({
        addr: addr,
        weight: weight
    }));
  }

}
