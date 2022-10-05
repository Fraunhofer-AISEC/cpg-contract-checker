pragma solidity ^0.4.21;

contract GetBiggest {

uint public val1 = 1;
uint public val2 = 2;
uint public val3 = 3;
uint public val4 = 0;



        function getBiggestValue() public view returns(uint) {

            uint x = val1;


            if(x < val2) {
                    x = val2; 

                }

            if(x < val3) {
                    x = val3; 

                }

            if(x < val4) {
                    x = val4; 

                }

        }

}
