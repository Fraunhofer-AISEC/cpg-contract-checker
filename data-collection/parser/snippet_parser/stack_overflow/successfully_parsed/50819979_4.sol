contract ProxyController{

    ContractA a;
    ContractB b;

    constructor() public {
       a=new ContractA();
       b=new ContractB();
    }


    function AgetValue() public view returns (string){
        return a.getValue();
    }

    function BgetValue() public view returns (string){
        return b.getValue();
    }        

}
