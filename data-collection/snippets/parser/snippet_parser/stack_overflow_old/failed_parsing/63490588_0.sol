pragma solidity ^0.5.0;



interface YourErc20Contract {
        function transfer(address recipient, uint amount) external;
    }

contract CallingContract {
    
    address your_erc20_address = 0x.....  
    address recipient = 0x....  
    uint amount = 2  


    
    function remoteCall(address recipient, uint amount) public {
        YourErc20Contract(your_erc20_address).transfer(recipient, amount)
        }
    }
