function get_f(uint a, uint b) public returns(uint){
        uint[] ret = f(a,b);
        return(ret[0]); 
    }
