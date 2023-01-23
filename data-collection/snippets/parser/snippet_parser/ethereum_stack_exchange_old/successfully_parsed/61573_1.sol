mapping(uint256 => bool) public paid;

function MLMloyalityPoints(string _Compney_name,uint256 _refreeid) public payable {
    require(!payed[_refreeid]);
    address  tempaddress = clients[_refreeid-1];
    
    tempaddress.transfer(1000000000000000);
    paid[_refreeid] = true;
}
