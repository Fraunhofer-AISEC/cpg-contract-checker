contract user {

    address public owner;

    function user(){
        owner = msg.sender;
        }

    function kill(){
        suicide(owner);
    }

    modifier onlyOwner{
        if (msg.sender != owner){
            throw;
        }else{
            -
        }
    }
}
