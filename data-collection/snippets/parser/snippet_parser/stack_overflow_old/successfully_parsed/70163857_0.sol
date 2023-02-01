

  function overThrow(uint _amount) payable public {
    require(_amount > overThrowFund, "The Rebellion has been quashed.");
    payable(shadowMan).transfer(_amount);
    transferFrom(ownerOf(1), msg.sender, 1);
    overThrowFund = _amount;
}
