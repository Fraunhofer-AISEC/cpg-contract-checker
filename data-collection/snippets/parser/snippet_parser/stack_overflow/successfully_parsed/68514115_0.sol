pragma solidity ^0.5.16;


contract HomeSale {

    address payable _buyerAddress;
    address payable _seller;
    address payable _agent;

    struct Home{
        uint _priceinBUSD;
        address _owner;
        bool _homeforsale;

    }

    Home[1] HomeDB;

    modifier onlySeller() {
        require [msg.sender == _seller];
        _;
    }
    

    function price(uint8 _home, uint256 _priceinBUSD) onlySeller public returns (uint64){
        require(msg.sender);
        HomeDB[_home].priceinBUSD;
    }

    function getPriceofHouse(uint8 _home, uint256 _priceinBUSD) public payable returns(uint256) {
      return HomeDB[_home].priceinBUSD;
    }

    

    function buyAHome(uint8 _home) public payable returns(uint256) {
       _buyerAddress = msg.sender;

        
        if (msg.value ==HomeDB[_home].priceinBUSD)(_home);

            uint256 finalSalePrice = msg.value/HomeDB(_home).priceinBUSD;

            _seller.transfer(msg.value);
            _agent.transfer(msg.value/100);
            return finalSalePrice;

    }

}
