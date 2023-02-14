import "./ContractB.sol";

contract ContractA is ContractB {

    function buyRep(uint _amount) public {
      burn(_amount);
    }
}
