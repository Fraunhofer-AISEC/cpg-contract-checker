pragma solidity 0.6.12;


contract Test {
    uint256[] public bidderItemID;
    
    function setBidderItemID() public {
        bidderItemID = [1,2,3];
    }
    
    function deleteBidderItemID() public {
        delete bidderItemID;
    }
}
