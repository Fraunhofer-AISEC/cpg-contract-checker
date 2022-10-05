contract F {
    uint public x;
    address addressE = 0x98789aD9797ad908097ad9870987DDD97897aD ;
    address public sender;

    function F() {
    }

    function setE(uint num) returns(bool) {
         x=num;
        return addressE.callcode('set(uint256)', num);
    }

    function getE() returns(uint) {
        return ?????????????;  
    }

}
