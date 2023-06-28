pragma solidity ^0.4.18;

contract Plant {

    address public creator;

    
    uint public number_of_leaves;
    uint public remaining_leaves = 0; 
    uint public initial_coins;
    uint public total_supply;
    uint public finney_balance; 
    uint public plant_price = 60; 
    uint public number_of_plants;

    
    modifier onlyIfEnoughMoney() {
        require(finney_balance > plant_price); 
        _;
    }

    
    modifier onlyCreator() {
        require(msg.sender == creator);
        _;
    }

    
    modifier enoughToInitialise() {
        require(msg.value > 0);
        _;
    }

    function Plant(uint _number_of_leaves, uint _initial_coins) public payable enoughToInitialise {
        number_of_leaves = _number_of_leaves;
        remaining_leaves = number_of_leaves;
        initial_coins = _initial_coins;
        total_supply = initial_coins;
        finney_balance = msg.value/1000000000000000;
        creator = msg.sender;
        number_of_plants ++;
        depositedFunds(msg.value, finney_balance);
    }

    function buy_new_plant() private onlyIfEnoughMoney {

        uint number_plants_to_buy = finney_balance / plant_price;

        total_supply += (initial_coins*number_plants_to_buy);
        finney_balance -= (plant_price*number_plants_to_buy);
        number_of_plants += number_plants_to_buy; 
        plantWasPurchased(finney_balance, total_supply, number_of_plants);
    }

    function () payable public {
        finney_balance += msg.value/1000000000000000;
        buy_new_plant();
        depositedFunds(msg.value, finney_balance);
    }

    function terminate() private onlyCreator{
        selfdestruct(creator);
    }

    function leafPicked(uint numPicked) public onlyCreator returns (uint){
        require(numPicked < remaining_leaves);
        remaining_leaves -= numPicked;
        leafWasPicked(remaining_leaves, numPicked);
    }

    event leafWasPicked(uint leavesLeft, uint numberTaken);
    event plantWasPurchased(uint newBalance, uint newTotalSupply, uint newPlantNumber); 
    event depositedFunds(uint amount, uint newBalance); 

}
