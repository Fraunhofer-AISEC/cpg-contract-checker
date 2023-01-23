contract Sandbox {

    function retArr() 
    public constant returns (byte[3][10] ret) {
        ret[0][2] = byte(2);
    }

}
