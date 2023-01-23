error TestObject__IndexNotFound();

function getProductChain(uint256 index) public view returns(SupplyChain memory){
    if (index > (counter - 1) || index < 0){
        revert TestObject__IndexNotFound();
    }
    SupplyChain memory spChain = supplyChain[index];
    return spChain;
}
