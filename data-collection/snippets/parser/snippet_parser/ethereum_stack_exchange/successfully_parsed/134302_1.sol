
pragma solidity ^0.8.16;



contract Digit {
    
    
    
    
    
    function getDigitAtIndex(uint256 n, uint index) public pure returns(uint256) {

        
        
        
        
        

        return (n / (10 ** index)) % 10;
    }

    
    
    
    
    
    function getFirstDigit(uint256 n) public pure returns(uint256) {

        
        
        

        uint256 countOfDigits = log10(n);
        return n / (10 ** (countOfDigits - 1));
    }

    
    function getLastDigit(uint256 n) public pure returns(uint256) {
        return n % 10;
    }

    
    
    function log10(uint256 n) public pure returns(uint256) {
        uint256 count;
        while(n != 0) {
            count++;
            n /= 10;
        }
        return count;
    }

}
