struct Rider{
    
    uint rider_Id;
    bytes32 Rname;
    bool set;
}

mapping(address => Rider) public riders;

function registerRider(address _riderAddr, uint _riderId, bytes32 _riderName) public {
    Rider storage rider = riders[_riderAddr];
    
    require(!rider.set);
    
    riders[_riderAddr] = Rider({
        rider_Id: _riderId,
        Rname: _riderName,
        set: true
    });
}
