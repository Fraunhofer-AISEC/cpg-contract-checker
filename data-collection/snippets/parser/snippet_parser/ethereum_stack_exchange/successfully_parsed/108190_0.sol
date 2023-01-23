uint constant maxCalls = 100;

struct Object {
    uint256 property;
}

Object[] public objects;

function _mintFor(address _to, uint256 _id) internal override {
    require (
        objects.length < maxCalls,
        "Max calls reached. Can't make any more objects."
    );
    
    objects.push (
        Object(0123456789)
    );
    
    _safeMint(_to, _id);
}        

function getObjectCount() public view returns (uint256) {
    return objects.length;
}
