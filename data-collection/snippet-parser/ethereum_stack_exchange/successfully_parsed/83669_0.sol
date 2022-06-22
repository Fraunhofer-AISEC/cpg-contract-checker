pragma solidity >=0.5.16;
pragma experimental ABIEncoderV2;

library BrickLib {
    struct ECSignature {
        uint8 v;
    }

    function checkSig(ECSignature memory sig)
    public pure returns(bool) {
        return true;
    }
}
