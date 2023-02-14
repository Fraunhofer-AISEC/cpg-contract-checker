import "./SafeMath.sol";

contract Constants {
    uint8 public constant BUY_ID = 1;
    uint8 public constant SUBSCRIBE_ID = 2;
}

contract BuyContract is Constants {

    uint256 public lastAmount;

    function buyMethod(uint8 _buyArg) payable public {
        require(_buyArg == BUY_ID);
        lastAmount = msg.value;
    }

}

contract SubscribeContract is Constants {

    uint256 public lastAmount;

    function subscribeMethod(uint8 _subscribeArg) payable public {
        require(_subscribeArg == SUBSCRIBE_ID);
        lastAmount = msg.value;
    }

}

contract MyContract is Constants {
    using SafeMath for uint256;

  function singleTransaction(
      address _buyAddress,
      address _subscribeAddress
  ) payable public {
      BuyContract buyContract = BuyContract(_buyAddress);
      SubscribeContract subContract = SubscribeContract(_subscribeAddress);
      uint256 halfValue = msg.value.div(2);
      buyContract.buyMethod.value(halfValue)(BUY_ID);
      subContract.subscribeMethod.value(halfValue)(SUBSCRIBE_ID);
  }

}
