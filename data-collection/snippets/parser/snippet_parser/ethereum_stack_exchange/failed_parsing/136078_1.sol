string name;
IERC20 token= IERC20(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

modifier hasBalance() {
    require(token.balanceOf(msg.sender) >= 
    balanceAllowedTocallTransaction, "not enough");
_;

constructro(){}


function setName(string memory _name)public hasBalance {
    name=_name;
}
