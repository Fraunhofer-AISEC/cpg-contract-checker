function WeeklyW1() public  view returns (address,uint, uint){

    uint randWinAddr = uint(block.blockhash(block.number - 1)) % subscriberListW1.length;
    winner = subscriberListW1[randWinAddr];

    for (uint i=0; i<subscriberListW1.length; i++) {
    uint value = (_balances[subscriberListW1[i]] * subscriberListW1.length) * 20/100;      
    uint value1 = ((_balances[subscriberListW1[i]] * subscriberListW1.length)
                    - (_balances[subscriberListW1[i]] * subscriberListW1.length) * 20/100);

    _balances[subscriberListW1[randWinAddr]] += value1 ;
    _balances[owner] += value;

    
    owner.transfer(address(value).balance);
    winner.transfer(address(value1).balance);

    
    return (winner,_balances[subscriberListW1[randWinAddr]],_balances[owner]);

    }
}
