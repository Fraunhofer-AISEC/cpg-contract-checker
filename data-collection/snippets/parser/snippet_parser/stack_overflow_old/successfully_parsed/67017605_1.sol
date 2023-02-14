pragma solidity ^0.8.3;

contract pendulum_ico {
    


    uint public max_pendulum = 1000000;
    


    uint public usd_to_pendulum = 1000;
    


    uint public total_pendulum_bought = 0;
    


    mapping(address => uint) equity_pendulum;
    mapping(address => uint) equity_usd;
    


    modifier can_buy_pendulum(uint usd_invested) {
        require (usd_invested * usd_to_pendulum + total_pendulum_bought <= max_pendulum);
        _;
    }
    


    function equity_in_pendulum(address investor) external constant returns (uint) { 
        return equity_pendulum[investor];
    }                             
    


    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }
    


    function buy_pendulum(address investor, uint usd_invested) external
    can_buy_pendulum(usd_invested) {
        uint pendulum_bought = usd_invested * usd_to_pendulum;
        equity_pendulum[investor] += pendulum_bought;
        equity_usd[investor] = equity_pendulum[investor] / 1000;
        total_pendulum_bought += hadcoins_bought;
        
    }
    


    function sell_pendulum(address investor, uint pendulum_sold) external {
        equity_pendulum[investor] -= pendulum_sold;
        equity_usd[investor] = equity_pendulum[investor] / 1000;
        total_pendulum_bought -= pendulum_sold;
    }
    
}
