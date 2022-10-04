contract demo{

    address public user;
    uint  public  i=0;

    function demo(){
        user=msg.sender;
    }

    address[10] users;
    bytes32[10] name;

    function add(bytes32 _name){

        users[i]=user;
        name[i]=_name;
        i++;

    }

    function get_names() returns(bytes32[10]){
        return name;
    }

    function get_address() returns(address[10]){
        return users;
    }
  }
