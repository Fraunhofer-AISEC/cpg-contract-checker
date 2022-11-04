pragma experimental ABIEncoderV2;

interface CupInteraface {
    struct S {
        bytes32 s;
    }
    function get(bytes32 cup) external returns (S memory);
}

contract Cup is CupInteraface {
    mapping(bytes32 => S) private _cups;

    constructor(bytes32 cup) public {
        _cups[cup] = S(cup);
    }

    function get(bytes32 cup) public returns (S memory) {
        return _cups[cup];
    }
}
