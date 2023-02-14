  function answerBounty(
    uint _bountyId,
    string memory _answerId)
    public
    validateBountyArrayIndex(_bountyId)
  {
    bounties[_bountyId].hasBeenAnswered = true;
    bounties[_bountyId].fulfillments.push(Fulfillment(_answerId, msg.sender, block.timestamp));
    uint answerIndex = bounties[_bountyId].fulfillments.length - 1;

    emit BountyFulfilled(_bountyId, msg.sender, _answerId, answerIndex);
  }
