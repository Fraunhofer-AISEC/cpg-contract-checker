      contract Users {

    mapping (address => bytes32) public names;
    mapping (bytes32 => address) public owners;

    function register(bytes32 name) {

            owners[name] = msg.sender;
            names[msg.sender] = name;


    }
}
