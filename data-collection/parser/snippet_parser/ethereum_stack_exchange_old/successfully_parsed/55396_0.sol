contract admined {
address public admin;

function admined() public {
    admin = msg.sender;
}

modifier onlyAdmin(){
    require(msg.sender == admin) ;
    _;
}

function transferAdminship(address newAdmin) onlyAdmin public {
    admin = newAdmin;
}

}
