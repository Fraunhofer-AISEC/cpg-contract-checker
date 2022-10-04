struct RRSet {
    uint32 inception;
    uint32 expiration;
    bytes20 hash;
}

constructor(bytes memory _anchors) {
    
    
    anchors = _anchors;
    rrsets[keccak256(hex"00")][DNSTYPE_DS] = RRSet({
        inception: uint32(0),
        expiration: uint32(3767581600), 
        hash: bytes20(keccak256(anchors))
    });
    emit RRSetUpdated(hex"00", anchors);
}
