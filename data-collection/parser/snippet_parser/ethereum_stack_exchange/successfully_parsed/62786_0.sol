pragma solidity ^0.4.23;
contract Simple {
    function arithmetics(uint a, uint b){           
                     require(a % 2 == 0, "Even value required.");             
                    b = b * 3; 
            }
}
