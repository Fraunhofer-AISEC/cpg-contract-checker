function payTaxes(string memory _taxID, uint _amount, address _to) public payable {
    if (msg.sender!= gov6) {
        if (taxStructs[msg.sender][_taxID].bracket != 1) {
            if (taxStructs[msg.sender][_taxID].taxessettled = false) {

                address payable to = payable(_to);
                to.transfer(_amount);
                taxStructs[msg.sender][_taxID].taxessettled = true;
                taxStructs[msg.sender][_taxID].taxdue = 0;
            }
        }
    }
}
