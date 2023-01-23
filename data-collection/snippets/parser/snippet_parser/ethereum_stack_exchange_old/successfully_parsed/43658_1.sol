contract heheBox { 

    struct DataBox {
        mapping(address => string) Data_01;
        mapping(address => string) Data_02;
    }

    mapping(address => DataBox) DataBox_hehe;

    function save(string _InputData_01, string _InputData_02) public  {
        DataBox_hehe[msg.sender].Data_01[msg.sender] = _InputData_01;
        DataBox_hehe[msg.sender].Data_02[msg.sender] = _InputData_02;
    }   

    function display(address addressBox, address addressMap) constant public returns(string, string) {
        return(DataBox_hehe[addressBox].Data_01[addressMap], DataBox_hehe[addressBox].Data_02[addressMap]);
    }   

}
