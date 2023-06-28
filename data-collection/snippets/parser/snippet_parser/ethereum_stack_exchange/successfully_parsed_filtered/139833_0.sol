        
function store_me_on_chain(bytes32 _data) public returns (string memory) {
    require(msg.sender == admin, 'Not admin');
    data_store = _data;
    data_set = asmbl();
    ds_to_Str = Strings.toString(data_set);
    return data = string("den_who_is_dan_");
}


function asmbl() public view returns (uint8 b) {
    assembly {
        let c := add(27, 16)
        mstore(0x80, c)
        { let d := add(sload(c), 255) b := d }
        b := add(b, c) }
    }
