

pragma solidity >=0.7.0 <0.9.0;


contract Contract {

 

    function getNumAndAlpha() public pure returns( string memory Number, string memory Alpha){

    bytes memory number;
    bytes memory alpha;
    string memory str = "1jfjw2j34jcnsj512jdn3";

    bytes memory b = bytes(str);

    for(uint i=0; i < b.length; i++){

        if (b[i] == "0" ||  b[i] == "1" || b[i] == "2" || b[i] == "3" || b[i] == "4" || b[i] == "5") {

            number = (abi.encodePacked(number,b[i]));

        } else {

           alpha = (abi.encodePacked(alpha,b[i]));
        }
    }

          return (string(number), string(alpha));

    }


} 
