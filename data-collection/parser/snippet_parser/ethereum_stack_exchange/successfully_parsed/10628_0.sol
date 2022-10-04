contract Client{
    Server public s  = new Server();
    function doit(){
        s.homicide();
        throw;
    }
}
contract Server{ 
    bool public alive = true;
    function homicide(){
        Suicide();
        suicide(msg.sender);

    }
    event Suicide();
}
