
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract test {

    string[][] x ;
    uint256 size = 3;

    function setx () public {
        x.push(["1","2","3"]);
        x.push(["4","5","6"]);
        x.push(["7","8","9"]);
    }

    function getrow(uint256 i) public view returns (string[] memory) {
        return x[i];
    }

    function getcolumn(uint256 j) public view returns (string[size] memory) { /error here

        string[size] memory ret; 

        for (uint256 i=0; i < size ; i++) {
            ret[i] = x[i][j];
        }
        
        return ret;
    }
}
