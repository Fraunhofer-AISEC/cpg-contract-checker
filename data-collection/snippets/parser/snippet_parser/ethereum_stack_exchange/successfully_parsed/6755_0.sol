library Lib{
    struct Data {
        mapping (uint => uint) a;
    }

    function inc(Data self) internal{
        self.a[0] =+1;
    }
}
contract Example{

    address recipient = 0x0000cafebabe;

    Lib.Data data;

    function send(){
        Lib.inc(data);
    }
}
