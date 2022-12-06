contract contractB is Ownable {
  address contract_a;

  constructor(address contract_address) {
    contract_a = account;
  }

  function mint(address account, uint256 amount) public onlyOwner {
    (bool success, ) = contract_a.call(
      abi.encodeWithSignature("mint(address,uint256)", account, amount)
    );

    require(success, "call failed");
  }
}
