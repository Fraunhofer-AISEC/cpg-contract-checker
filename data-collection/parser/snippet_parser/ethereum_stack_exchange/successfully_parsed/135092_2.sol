  function mint(to, amount) {
    owners.push(to);

    assembly {
     sstore(owners.slot, add(sload(owners.slot), sub(amount, 1)))
    }
  }
