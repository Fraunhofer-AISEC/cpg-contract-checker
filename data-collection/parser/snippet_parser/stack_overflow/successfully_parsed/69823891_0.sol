pragma solidity >=0.4.16 <0.9.0;

contract Wallet {

    uint balance = 0;
    
    bool a = true;
    
    
    function deposit(uint dep_amt) public {
        balance += dep_amt;
    }

    function withdraw (uint wdraw_amt) public view returns(string memory error){
        if(wdraw_amt<=balance){
         balance -= wdraw_amt;
        }
        
        else{
        error = "Insufficient Balance";
        return error;
        }

    }

    function getBalnce() public view returns (uint) {
       
        return balance;
    }
    

}
