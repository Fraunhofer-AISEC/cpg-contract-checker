uint8 number;

function isNumberValid() external returns (bool) {
    uint8 _number = number; 
    return (
        _number >= 100  
        && _number <= 200  
    );
}
