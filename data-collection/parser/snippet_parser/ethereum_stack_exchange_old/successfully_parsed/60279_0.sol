contract one {
      function buyTokens(address _beneficiary) public payable {
        require(msg.value == 1 ether);
       
      }
}
