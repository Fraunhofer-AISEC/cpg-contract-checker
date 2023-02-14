

pragma solidity ^0.4.26;

contract LargestOfFourNums {
    function largestOfFour(
        uint256 num1,
        uint256 num2,
        uint256 num3,
        uint256 num4
    ) public view returns (uint256 result) {

        assembly {
            let winnerA := gt(num1, num2)
            let winnerB := gt(num3, num4)
    

            jumpi(num1Greater, gt(winnerA, winnerB))
            jump(num2Greater)

        num1Greater:
            result := winnerA
            jump(end)
        num2Greater:
            result := winnerB
        end:
        }
    }
}

