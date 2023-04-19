

pragma solidity 0.8.3;

contract StackTooDeepSolution {

    
    struct Numbers {
        uint one;
        uint two;
        uint three;
        uint four;
        uint five;
        uint six;
        uint seven;
        uint eight;
    }
    
    
    function addData(Numbers memory firstNum, Numbers memory secondNum, Numbers memory thirdNum) external view returns (uint sum) {

        sum = firstNum.one + firstNum.two + firstNum.three + firstNum.four + firstNum.five + firstNum.six + firstNum.seven + firstNum.eight;
        sum += secondNum.one + secondNum.two + secondNum.three + secondNum.four + secondNum.five + secondNum.six + secondNum.seven + secondNum.eight;
        sum += thirdNum.one + thirdNum.two + thirdNum.three + thirdNum.four + thirdNum.five + thirdNum.six + thirdNum.seven + thirdNum.eight;
    }


}
