 pragma solidity >=0.4.22 <0.6.0;

contract Judge {

    struct Misbehavior{
        address subject;   
        address device;
        string resource;
        string action;   
        string misbehavior;
        uint time;   
        uint penalty;   
    }

    mapping (address => Misbehavior[]) public MisbehaviorList;

    function misbeaviorJudge(
        address _subject, 
        address  _device, 
        string memory _resource,
        string memory _action,
        string memory _misbehavior,
        uint  _time) 
        public returns (uint  penalty) 
    {
        penalty = MisbehaviorList[_subject].length;
        MisbehaviorList[_subject].push(Misbehavior(_subject, _device, _resource, _action, _misbehavior, _time, penalty));
    }

    function getLatestMisbehavior(address _requester) public view 
        returns (address _subject, address _device, string memory _resource, string memory _action, string memory _misbehavior, uint _time)
    {
        uint latest = MisbehaviorList[_requester].length  - 1;
        _subject = MisbehaviorList[_requester][latest].subject;
        _device = MisbehaviorList[_requester][latest].device;
        _resource = MisbehaviorList[_requester][latest].resource;
        _action = MisbehaviorList[_requester][latest].action;
        _misbehavior = MisbehaviorList[_requester][latest].misbehavior;
        _time = MisbehaviorList[_requester][latest].time;
    }
}
