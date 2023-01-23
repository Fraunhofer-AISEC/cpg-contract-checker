function play() external payable returns(bool) {
    require(
      msg.value == price,
      'Please send the correct amount of ETH'
    );
}