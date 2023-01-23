pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;

contract ArrayExamples {

    int[][] public matriz;


    
    function receive_data(int[] data) public {
        matriz.push(data);
    }


    function teste() public returns (int[] v) {

        int[] x;
        int[] y;

        uint t = matriz.length;

        for(uint i = 0; i < t; i++) {

            x[i] = matriz[i][0];
            y[i] = matriz[i][1];

        }

        return x;
    }

  }
