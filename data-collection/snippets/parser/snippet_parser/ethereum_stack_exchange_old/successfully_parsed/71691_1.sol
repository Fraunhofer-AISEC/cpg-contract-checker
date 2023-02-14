
function gatewayUnbond(uint quantity) public payable {

    require(unbondAllow, "unbond not allowed");
    super.unbond(msg.sender, gatewaySpecifier, quantity);
}
