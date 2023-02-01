  function mySales( address a) constant public canWithdraw returns (uint){
    return totalSales[a];
}

function topSalesPerson() constant public returns ( address ){
    return topsales;
}

event bonusDepleted(string);

function submitSales() public payable canWithdraw{

    uint amount = msg.value;
    uint bonus_temp;
    if (this.balance >0){
        if(amount > 50000000000000000000){
            bonus_temp = amount/10; 
        }
        if(bonus_temp > 20000000000000000000){
            bonus_temp = 20000000000000000000;  
        }

        if (this.balance > bonus_temp){
             msg.sender.transfer(bonus_temp);  
        }
       else{
            msg.sender.transfer(this.balance); 
       }
        owner.transfer(amount);

        Bonus[msg.sender] += bonus_temp;
        totalSales[msg.sender] += msg.value;

        if( totalSales[topsales] < totalSales[msg.sender]){
            topsales = msg.sender;
        }
    }

    if(this.balance == 0){
        bonusDepleted("Bonus has reached its limit and no bonus will be provided for future sales");
    }
}`
