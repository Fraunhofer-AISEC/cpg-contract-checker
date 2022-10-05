pragma solidity ^0.5.1;

contract Cookie {
    address public CookieAddress;
    string public CookieName;

    constructor() public {
        CookieAddress = address(this);
    }

    function theCookieInfo() view public returns(address, string memory) {
        return (CookieAddress, CookieName);
    }

}


contract Baker is Cookie {

    address public BakerAddress;
    address[] public CookieAddresses;

    constructor() public {
        BakerAddress = address(this);
    }    

    function bakeNewCookie(string memory _name) public returns(bool) {
        new Cookie();
        Cookie.CookieName = _name;
        CookieAddresses.push(CookieAddress);
        return true;
    }

    function getCookieArray() view public returns(address[] memory) {
        return CookieAddresses;
    }

    function myCookieAddress(address _addressOfCookie) view public returns(string memory) {
        Cookie my_cookie = Cookie(_addressOfCookie);
        return my_cookie.CookieName();
  }    


}
