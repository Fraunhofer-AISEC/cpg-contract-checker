contract Demo {
    address public master;
    uint256 public callTimer;
    function setMaster(address master_) external {
        master = master_;
    }
    
    function demoFunction() external{
        require(msg.sender == master, "caller is not the master");
        callTimer++;
    }
}
