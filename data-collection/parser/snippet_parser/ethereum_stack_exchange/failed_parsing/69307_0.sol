modifier contains (string memory what, string memory where) {
    bytes memory whatBytes = bytes (what);
    bytes memory whereBytes = bytes (where);

    require(whereBytes.length >= whatBytes.length);

    bool found = false;
    for (uint i = 0; i <= whereBytes.length - whatBytes.length; i++) {
        bool flag = true;
        for (uint j = 0; j < whatBytes.length; j++)
            if (whereBytes [i + j] != whatBytes [j]) {
                flag = false;
                break;
            }
        if (flag) {
            found = true;
            break;
        }
    }
    require (found);

    _;
}

function foo (string memory str) public contains ("solidity", str) {
    ...
}
