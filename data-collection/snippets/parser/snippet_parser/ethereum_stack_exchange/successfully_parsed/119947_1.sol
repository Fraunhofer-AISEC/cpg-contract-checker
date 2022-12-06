
struct State1 {
    uint8 myNumber;
    int24 myInteger;
}

struct State2 {
    int24 myNumber;
    int24 myInteger;
}

State1 state1 = State1(1, 1);
State2 state2 = State2(1, 1);

function test1() public view returns (int24) {
    return state1.myInteger + int24(uint24(state1.myNumber));
}


function test2() public view returns (int24) {
    return state2.myInteger + state2.myNumber;
}


