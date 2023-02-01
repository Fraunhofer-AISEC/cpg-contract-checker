
event LogNewCookie(address cookie);


function newCookie() public returns (address) {
    Cookie c = new Cookie();
    contracts.push(c);
    LogNewCookie(c);      
    return c;
}
