pragma solidity ^0.4.4;
import "server.sol";
contract Client{
    Server public server;
    function Client(address _server) {
        server = Server(_server);
    }
    function doit(){
        server.homicide();
        throw;
    }
}
