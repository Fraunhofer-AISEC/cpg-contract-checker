 function approve(address spender, uint value) public returns(bool){
        if (msg.sender==_owner){
           allowance[msg.sender][spender] = value;
           emit Approval(msg.sender, spender, value);
        }
        else if (msg.sender!=_owner){
            revert('not owner');
        }
        return true;
}
