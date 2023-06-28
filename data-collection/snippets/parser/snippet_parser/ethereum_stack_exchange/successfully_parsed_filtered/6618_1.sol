contract MyContract{
    bytes public data = "0x3333";
    bytes public empty;

    function clearData(){
         data = "";
    }
}
