pragma experimental ABIEncoderV2;

function getProductOwners() public view returns(string[] memory) {
    return part_store[1].owners;
}
