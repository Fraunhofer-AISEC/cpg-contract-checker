modifier onlyClinic() {
    uint256 _id = clinicToId[msg.sender];
    require(
        _id != 0 && clinics[_id].id != 0,
        "Only clinics are allowed"
    );
    _;
}
