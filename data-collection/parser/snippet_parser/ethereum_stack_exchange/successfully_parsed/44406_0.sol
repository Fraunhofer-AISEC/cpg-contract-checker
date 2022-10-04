function bonusCalculate(uint _value) public pure returns(uint) {

        if(_value <= 50 ether) {
          return 250;
        } else if (_value >= 100 ether) {
          return 500; 
        }
     }
