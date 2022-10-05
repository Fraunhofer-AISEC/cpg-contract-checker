




pragma solidity ^0.8.0;




    function withdraw()payable public {
        msg.sender.transfer(address(this).balance);
    }
    
}
