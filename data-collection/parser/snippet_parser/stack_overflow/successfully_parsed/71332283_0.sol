uint8 number;

function isNumberValid() external returns (bool) {
    return (
        number >= 100  
        && number <= 200  
    );
}
