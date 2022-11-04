contract Looper {
    uint public totalPeople;
    uint[] public peopleValue;
    

    funciton add10() external {
       for(uint i = 0,i<= totalPeople;i++){
          peopleValue[i] = peopleValue[i] + 10;
       }
    }
}

