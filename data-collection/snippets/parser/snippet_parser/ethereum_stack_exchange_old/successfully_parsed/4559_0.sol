contract tradefin {

    uint public prodcode;
    address public seller;
    address public buyer;
    uint public price;
    uint public units;
    address public port;
    address public customs;
    address public delivery;
    string public portcheck;
    string public customscheck;
    string public deliverycheck;
    string public msg1;


    function initiate(uint code, address vendor, address applicant, 
        uint amount, uint quantity, address p, address c, address d) {
        prodcode = code;
        seller = vendor;
        buyer = applicant;
        price = amount;
        units = quantity;
        port = p;
        customs = c;
        delivery = d;
    }

    function review() constant returns (uint retval) {
        return uint(prodcode);
    }

    function finall() constant returns (string retval) {
        return string(deliverycheck);
    }    

    function approve() constant returns (string retval) {
        if (msg.sender == port) {
            portcheck = "signed";
        }

        if (msg.sender == customs) {
            if (portcheck == "signed")             
                customscheck = "signed";
            else 
                msg1 = "Port yet to sign";
            return msg1;
        }
    
        if (msg.sender == delivery) {
            if (customscheck == "signed")
                deliverycheck = "signed";
            else            
                msg1 = "Custom yet to sign";
            return msg1;            
        }
    }    
}
