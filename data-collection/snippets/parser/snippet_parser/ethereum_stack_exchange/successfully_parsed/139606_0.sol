function gerReferalCode() external returns ( uint256 ) {
    uint256 h;
    do {
        h = _hash(1);
    } while ( referalIsUsed[ h ] );
    referalIsUsed[ h ] = true;
    referalCode[ msg.sender ] = h;
    Data storage d = signings[ h ];
    d.owner = msg.sender;

    return h;
}
