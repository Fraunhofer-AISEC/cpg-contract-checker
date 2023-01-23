uint max_val = 3 * 10** 18; 
bool finished = false; 


function sendEth() payable {
    require(!finished); 
    require(this.balance <= max_val);  
}


function isFinished() {
    require(!finished); 
    require(this.balance == max_val);  
    finished = true;
}
