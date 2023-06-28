contract NameReg {
    bytes32 public nn;
    bytes public calldata;

    function register(bytes32 name) {
      nn = name;    
    }

    function() {
        calldata = msg.data;
    }

    function doesNotCallRegister() {
        this.call("register", "MyName");
    }
 }
