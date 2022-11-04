interface ITarget {
    event OnTargetRun(address sender,uint256);
    function run()external;
}

contract Target is ITarget{
    uint256 public counter;
    address public runer;
    constructor(){
        counter=0;
    }
    function run()external{
        runer=msg.sender;
        counter++;
        emit OnTargetRun(msg.sender,counter);
    }
}

contract Runer {

event OnRunerRun(address sender);

constructor(){}

function run(address t) public {
    ITarget(t).run();
}
}
