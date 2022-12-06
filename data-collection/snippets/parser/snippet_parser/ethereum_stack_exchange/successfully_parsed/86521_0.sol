
contract Demo1{
    uint public goal = 2000;
    function getGoal() public returns(uint){
        return goal;
    }
}
contract Demo2{
    function test2(Demo1 demo1, uint b) public returns (uint){
        uint goal_ = demo1.getGoal();
        if(b < goal_){
            b += goal_;
        }
        return b;
    }
}
