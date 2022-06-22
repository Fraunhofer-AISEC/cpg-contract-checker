contract MyContract{
    bytes public data = 0x3333;

    function clearData(){
         data = 0x;
    }
}
