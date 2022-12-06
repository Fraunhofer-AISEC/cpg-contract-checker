pragma solidity 0.5.1;

contract hadcoin_ico{

    
    uint public max_hadcoins = 1000000;

    
    uint public hadcoin_to_usd = 1000;

    
    uint public number_of_coins_sold = 0;

    
    mapping (address => uint) equity_in_hadcoin;
    mapping(address => uint) equity_in_usd;
    modifier buycoin(uint usd_invested) {
        _;require(usd_invested*hadcoin_to_usd + number_of_coins_sold <= 1000000 );

    }
    function equity_in_coin(address investor) external view returns (uint){
        return equity_in_hadcoin[investor];
    }
    
    function equity_usd(address investor) external view returns (uint){
        return equity_in_usd[investor];
    }
    function buy(address investor, uint usd_invested)external
    buycoin(usd_invested){
        uint hadcoins_bought = usd_invested*hadcoin_to_usd;
        equity_in_hadcoin[investor] += hadcoins_bought;
        equity_in_usd[investor] = equity_in_hadcoin[investor]/1000;
        number_of_coins_sold += number_of_coins_sold;
    }
    function sell_hadcoin(address investor, uint hadcoins_to_sell) external{
        equity_in_hadcoin[investor] -= hadcoins_to_sell;
        equity_in_usd[investor] = equity_in_hadcoin[investor]/1000;
        number_of_coins_sold -= hadcoins_to_sell; 
        
    }
    
}
