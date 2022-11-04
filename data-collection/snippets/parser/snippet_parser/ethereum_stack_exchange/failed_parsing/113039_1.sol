Contract A{


function _burn(address account, uint amount) internal virtual{
}

}


Contract B is Contract A{


function burn(address account, uint amount) public {
_burn(account,amount);
}
}
