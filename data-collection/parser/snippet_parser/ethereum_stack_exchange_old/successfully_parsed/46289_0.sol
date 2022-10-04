  function buy(address _from,uint256 _price, uint256 _amount) onlyOwner public {



        uint256 dealamount;
        uint256 dealprice;

        for(uint256 count = 0;count <s.length;count++)
        {
            if(_amount==0) {
                break;
            }
            if(_price>=s[count].price)
            {
                dealprice = s[count].price;
                if(_amount >= s[count].amount){
                    dealamount = s[count].amount;
                }
                else {
                    dealamount = _amount;
                }
                s[count].amount-= dealamount;
                _amount-=dealamount;
                sectransfer(this,_from,dealamount,dealprice);
                deal(this,s[count].from,_from,now,dealamount,dealprice);
                sellmatch[s[count].price]-=dealamount;
            }
        }
        removezerosell();
        
        if (_amount > 0)
        {
            insertbuy(Order(orderno,now, _from, _price, _amount));
            
            
            buymatch[_price] += _amount;
            orderno++;
        }
    }


function sell(address _from,uint256 _price, uint256 _amount) onlyOwner public{

    
    
    if(balanceOf[_from] < _amount ) return;
    temptransfer(_from,this,_amount);

    uint256 dealamount;
    uint256 dealprice;

    for(uint256 count=0;count<b.length;count++)
    {
        if(_amount==0){
            break;
        }
        if(_price <= b[count].price){
            dealprice = _price;
            if(_amount >= b[count].amount){
                dealamount = b[count].amount;
            }
            else {
                dealamount = _amount;
            }
            b[count].amount -= dealamount;
            _amount -= dealamount;
            sectransfer(this,b[count].from,dealamount,dealprice);
            deal(this,_from,b[count].from,now,dealamount,dealprice);
            buymatch[b[count].price]-=dealamount;
        }
    }
    removezerobuy();
    if (_amount > 0)
    {
        insertsell(Order(orderno,now, _from, _price, _amount));
        
        sellmatch[_price] += _amount;
        orderno++;
    }
}
