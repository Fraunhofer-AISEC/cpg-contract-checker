contract A{
    bool public checkvalue;
function transferFrom(uint256 value)
    private 
    returns(bool){
    
    
        if (value == 2) return true;
        else return false;
    }
    function check()public{
        
        checkvalue = transferFrom(2);
    }
}
