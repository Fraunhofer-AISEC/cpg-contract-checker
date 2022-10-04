interface IDoubleTrade {
    function value() external returns (uint);
}

contract DoubleTrade is IDoubleTrade {
    uint public override value;
}

contract Escrow {
    function getValueFromDoubleTrade(IDoubleTrade _double)
        external
        returns (uint)
    {
        return _double.value();
    }
}
