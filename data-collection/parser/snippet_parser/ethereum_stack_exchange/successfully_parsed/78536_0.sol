pragma solidity >=0.4.22 <0.6.0;

contract AccessControl{
    address   public owner;
    Judge     public jc;

    constructor(address _jc) public {
        owner = msg.sender;
        jc = Judge(_jc);
    }

    function emitError(address subject) public returns (uint penalty) {
        penalty = jc.misbehaviorJudge(subject, owner, "data", "read", "Too frequent access!", now);
    }

}


contract Judge {
    function misbehaviorJudge(address _subject, address _object, string memory _resource, string memory _action, string memory _misbehavior, uint _time) public returns (uint);
}
