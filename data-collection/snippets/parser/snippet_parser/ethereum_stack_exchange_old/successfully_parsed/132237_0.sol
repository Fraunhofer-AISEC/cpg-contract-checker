


 
pragma solidity 0.8.15;

contract InformationProvider {
    address owner; 

    constructor() {
        owner = msg.sender;
    }

    event ExchangeEvent(string information);

    function provideInformation(uint256 requested_info_code) public payable { 
        
        string memory information = ""; 

        require(msg.value >= 0.5 ether, "Minimum ether is 0.5!");
        require(requested_info_code > 0, "info code must be > 0"); 

        uint256 received_ether = msg.value;

        uint256 LOW_PRICE = 0.5 ether; 
        uint256 MID_PRICE = 1.0 ether; 
        uint256 HIGH_PRICE = 1.5 ether; 

        if (requested_info_code == 1) {
            require(received_ether >= LOW_PRICE);
            if (received_ether - LOW_PRICE != 0) {
                payable(owner).transfer(msg.value - LOW_PRICE);
            }
            information = "some low value information";
        } else if (requested_info_code == 2) {
            require(received_ether >= MID_PRICE);
            if (received_ether - MID_PRICE != 0) {
                payable(owner).transfer(msg.value - MID_PRICE);
            }
            information = "some mid value information";
        } else {
            require(received_ether >= HIGH_PRICE);
            if (received_ether - HIGH_PRICE != 0) {
                payable(owner).transfer(msg.value - HIGH_PRICE);
            }
            information = "some high value information"; 
        }

        emit ExchangeEvent(information);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender must be user!"); 
        _;
    }

    function destroy() public onlyOwner {
        selfdestruct(payable(owner));
    }
}

