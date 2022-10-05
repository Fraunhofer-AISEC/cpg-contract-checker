 function AcceptOffer() public payable
    {
        if ( msg.sender != InstanceOwner )
        {
            revert("You are not the owner of this contract and cannot accept the offer");
        }
        if (State != StateType.OfferPlaced) {
            revert("You can only accept valid offers");
        }
        InstanceOwner.transfer(Change)
        InstanceBuyer.transfer(OfferPrice);
        State = StateType.Accepted;
    }
