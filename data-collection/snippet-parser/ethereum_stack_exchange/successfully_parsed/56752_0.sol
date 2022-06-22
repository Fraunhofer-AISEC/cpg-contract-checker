contract test_input_data{

address owner;

event log_input_data(address result);

constructor() public{

    owner = msg.sender;
}

function input_data(bytes data) public payable{

    address n = address(keccak256(data));

    emit log_input_data(n);

}

function() public payable{
    input_data(msg.data);
}}
