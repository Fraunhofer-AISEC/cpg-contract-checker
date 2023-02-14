contract Request is MasterContract, 
ApprovedParticipantsContract, ApprovedItemsContract {


    function Enquiry (address _address) returns (bool flag) {

    event itemsListDisplay (bytes32 itemId, bytes32 itemDescription, bytes32 auctionStatus);        


    if (approvedParticipantsList[_address].isValue) {

        uint len = itemsList.keys.length;

        for (uint i = 0; i < len; i++)  {

            bytes32 myItemId = itemsList.keys[i].itemId;
            bytes32 myItemDescription = itemsList.keys[i].itemDescription;
            bytes32 myAuctionStatus = itemsList.keys[i].auctionStatus;

            itemsListDisplay(myItemId, myItemDescription, myAuctionStatus);


        }



        return true;

    }

    return false;

    }

}
