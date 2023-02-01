''' //SPDX-License-Identifier: MIT 

     pragma solidity <0.9.0;

     contract lowlevel_w{ 
        uint public balanceReceived;

        receive() external payable{ 
          balanceReceived += address(this).balance; } 
        }

     contract lowlevel{ 
        receive() external payable{} 
       } '''
