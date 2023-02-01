modifier onlyIPFSHash (string memory str) {
    bytes memory b = bytes (str);
    require (b.length > 6);
    for (uint i = 0; i < b.length; i++)
        require (0x7ffeffe07ff7dfe03fe000000000000 & (uint(1) << uint8 (b [i])) > 0);

    _;
}
