pragma solidity ^0.4.25;
contract Split {
    address public constant MY_ADDRESS = 0x5Ac652E32b8064000a4ab34aF0AE24E4966E309E;
    address public constant BRO_ADDRESS = 0x43CcDF0774813B6E14E64b18b34dE438B039663C;

    function () external payable {
        if (msg.value > 0) {
            
            MY_ADDRESS.transfer(msg.value / 2);
            
            BRO_ADDRESS.transfer(address(this).balance);
        }
    }
}
