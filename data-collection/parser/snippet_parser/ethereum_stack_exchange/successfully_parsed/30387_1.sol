details private this_site;

function Site_contract(bytes32 _name, bytes32 _location, uint256 _number){

    this_site = details(_name, _location, _number);

}
