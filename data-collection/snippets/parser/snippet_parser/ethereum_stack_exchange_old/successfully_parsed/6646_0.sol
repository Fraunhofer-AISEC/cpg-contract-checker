contract Test{
    address public creator;

    function Test(){
        creator = msg.sender;
    }

    function get1() returns (address){
        return creator;
    }
}
