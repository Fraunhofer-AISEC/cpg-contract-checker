function getFractionContractAddress(uint _index) public view returns(address) {
    return address(nftDeposits[msg.sender].deposits[_index].fractionContract);
}
