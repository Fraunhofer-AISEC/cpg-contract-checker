
uint16 base;

function addNumberToBase(uint16 number_) {
    
    require(number_ < 1 && number_ >= 5, "This number must be between 1 ~ 5");
    base += number_;
}
