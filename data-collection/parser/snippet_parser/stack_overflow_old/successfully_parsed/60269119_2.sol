

contract casoDosTomates{
    address payable CICA = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
    address payable proxy= 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;
    address owner; 
    uint8 anos = 0;
    uint8 jurisprudencia = 5;
    uint valorDoTomateKG = 200 wei ;
    bool internal sementesDistribuidas;
    
    address[] productores;

    modifier insufficientBalance(){
        require(address(this).balance > valorDoTomateKG * quantidadeDeProdutores(), "insufficient balance");
        _;
    }
    modifier onlyOwner(){
        require(msg.sender == owner, "address is not this contract's owner");
        _;
    }
    modifier producersNotMax(){
        require(productores.length < quantidadeDeProdutores(), "productores size can not exceed 5");
        _;
    }
    modifier productoresNotZero(){
        require(productores.length > 0, "no productores registered");
        _;
    }
    constructor() public {
        owner = msg.sender;
        sementesDistribuidas = true;
        
        produtores = address[]();
    }
    function quantidadeDeProdutores() internal {
        return Produtores.length;
    }
    
    function addProdutor() public produtoresNotMax {
        
        produtores.push(msg.sender);
    }
    
    function accumulate() public onlyOwner produtoresNotZero {
        if (sementesDistribuidas == true){
            
            address(produtores[anos]).balance = msg.sender.value;
            anos++;
            if(anos >= jurisprudencia){
                sementesDistribuidas = false;
            }
        }
        else {
            
            setExpectativa();
        }
    }

    function setExpectativa () internal payable onlyOwner produtoresNotZero {
        require(anos >= jurisprudencia);

        if(sementesDistribuidas == false){
            
            uint256 sum = 0;
            
            
            
            for(uint i = 0; i < produtores.length; i++){
                address p = address(produtores[i]);
                require(p.balance >= valorDoTomateKG, "insufficient Productores balance");

                sum += p.balance;
                p.balance = 0;
            }
            
            address(this).transfer(sum);
        }
        else {
            
            require(address(this).balance > 0 wei, "no balance in contract");

            proxy.transfer(address(this).balance);
            address(this).balance = 0;
        }
    }
}
