
function getOngoingSales() public view returns(Sale[] memory) {
    uint256 _ongoingSalesCounter = 0;

    for(uint i = 0; i<sales.length; i++) {
        if (sales[i].ended == false) _ongoingSalesCounter++;
    }

    Sale[] memory _ongoingSales = new Sale[](_ongoingSalesCounter);

    uint256 _pos = 0;
    for(uint i = 0; i<sales.length; i++) {
        
        if (sales[i].ended == false) {
            _ongoingSales[_pos] = sales[i];
            _pos ++;
        }
    }

    return _ongoingSales;
}
