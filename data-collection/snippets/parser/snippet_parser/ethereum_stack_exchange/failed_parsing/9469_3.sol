contract DAO {
    function balanceOf(address addr) returns (uint);
    ...
}

contract WithdrawDAO {
    DAO constant public mainDAO = DAO(0x5c40ef6f527f4fba68368774e6130ce6515123f2);
    ...

    function withdraw(){
        uint balance = mainDAO.balanceOf(msg.sender);

        if (!mainDAO.transferFrom(msg.sender, this, balance) || !msg.sender.send(balance))
            throw;
    }
    ...
}
