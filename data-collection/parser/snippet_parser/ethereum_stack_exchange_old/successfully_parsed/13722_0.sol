contract project{

    address public user;
    bytes32[10] name;
    address[10] customer;
    uint public i=0;
    function project(){
        user=msg.sender;
    }



    function add(bytes32 _name){
        name[i]=_name;
        customer[i]=msg.sender;
        i++;
    }

    function get_address() constant returns(address[10]){
        return customer;
    }

    function reward() {
        for(uint i=0;i<10;i++)
        {
            customer[i].send(1);
        }

    }

}
