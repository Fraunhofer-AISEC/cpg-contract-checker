

pragma solidity 0.8.9;

library Types {

    enum Side {
        buy,
        sell
    }
}

contract B {

    event TookSide(string side);

    function bEnum(Types.Side side) external {
        
        if(side == Types.Side.buy) emit TookSide("buy");
        if(side == Types.Side.sell) emit TookSide("sell");
    }
}

contract A {

    B b;

    constructor(address _b) {
        b = B(_b);
    }

    function takeSide(Types.Side side) external returns(uint thing) {
        b.bEnum(side);
        thing = uint256(uint8(side));
    }
}
