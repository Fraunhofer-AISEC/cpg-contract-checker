    struct G1Point {
    uint256[2] X;
    uint256[2] Y;
    }

    function addition(G1Point memory p1, G1Point memory p2)
    internal
    view
    returns (G1Point memory r)
{
    uint256[8] memory input;
    input[0] = p1.X[0];
    input[1] = p1.X[1];
    input[2] = p1.Y[0];
    input[3] = p1.Y[1];
    input[4] = p2.X[0];
    input[5] = p2.X[1];
    input[6] = p2.Y[0];
    input[7] = p2.Y[1];
    bool success;
    assembly {
        success := staticcall(gas(), 0x0b, input, 256 , r, 0x80)
        switch success
            case 0 {
                invalid()
            }
    }
    require(success, "pairing-add-failed");
}
