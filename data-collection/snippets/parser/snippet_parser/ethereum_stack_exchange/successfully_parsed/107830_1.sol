
function approve(address spender, uint value) public returns(bool){
        if (msg.sender==_owner){
           allowance[msg.sender][spender] = value;
           emit Approval(msg.sender, spender, value);
 return true
        }
        else { 
            return 0;
        }
        
}