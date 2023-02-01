pragma solidity ^0.4.0;

contract Leontest1 {
    uint flight_number;
    uint day_number;
    string low_no = "This is a low flight number";

    function Leontest1() {
     
    }

    function low_numbers (uint flight_number) returns (string) {
        if (flight_number > 6) {low_no = "This is not a low flight number";} else {low_no = low_no;}
        return low_no;


    }
}
