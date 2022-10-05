import "./ellipticCurveOperations.sol" as Ops

contract addThings{
    using Ops for *;

    function add(Ops.Point a, Ops.Point b) public returns (Ops.Point){
        return Ops.addition(a, b);
    }
}
