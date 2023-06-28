function bonusCalculate(uint _value) public pure returns(uint) {

        if(_value <= 50*1000000000000000000) {
          return 250;
        } else if (_value >= 100*1000000000000000000) {
          return 500; 
        }
     }
