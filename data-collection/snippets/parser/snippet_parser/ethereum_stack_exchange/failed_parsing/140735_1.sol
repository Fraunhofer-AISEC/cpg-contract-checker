interface YourExternalContract {
    function burn(address from,uint256 id, uint256 amount) external;
}

contract fooContract {
    function burnExternalToken(
    address from,
    uint256 id,
    uint256 amount,
    address externalContract) external {
      contract = YourExternalContract(externalContract)
      require(contract.burn(from, id, amount),"burn failed");
    }

}
