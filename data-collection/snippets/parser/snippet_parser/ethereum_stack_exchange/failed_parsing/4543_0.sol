contract testOnlyBy {
    address master1;
    address master2;

    modifier onlyByMaster1 { if (msg.sender != master1) throw; _ }
    modifier onlyByMaster2 { if (msg.sender != master2) throw; _ }
    modifier onlyByMaster1or2 { if (msg.sender != master1 && msg.sender != master2) throw; _ }

    

    function testOnlyBy(address _master2) {
        master1 = msg.sender;
        master2 = _master2;
    }
    function get() external constant returns(address ret1, address ret2) {
        if (msg.sender == master1 || msg.sender == master2){
             return (master1, master2);
        }
    }
    function getonlyByMaster1() onlyByMaster1 external constant returns(address ret1, address ret2) {
        return (master1, master2);
    }
    function getonlyByMaster2() onlyByMaster2 external constant returns(address ret1, address ret2) {
         return (master1, master2);
    }
    function getonlyByMaster1or2() onlyByMaster1or2 external constant returns(address ret1, address ret2) {
         return (master1, master2);           
    }
}
