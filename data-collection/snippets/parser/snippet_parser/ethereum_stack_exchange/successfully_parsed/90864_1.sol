import "../libraries/safe.sol";


contract TokenSale {

  function test() public view returns (uint256){

        return safe.safeMultiply(5, 10);

    }

}
