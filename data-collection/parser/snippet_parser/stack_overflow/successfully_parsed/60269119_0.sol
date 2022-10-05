pragma solidity >=0.6.0 <0.6.2;

contract casoDosTomates{

    address payable CICA = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
    address payable produtores = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB;
    uint8 anos = 0;
    uint8 jurisprudencia = 5;
    uint valorDoTomateKG = 200 wei ;
    uint8 quantidadeDeProdutores = 5 ;

    function setExpectativa (bool trueOrFalse) payable public{
        bool sementesDistribuidas = trueOrFalse;
        if (sementesDistribuidas == true){  
            anos++;
        }

            else {

                if (anos >= jurisprudencia){

                    uint multa = (valorDoTomateKG * quantidadeDeProdutores);
                    produtores.transfer(multa);
            }

                    else{

                        uint multa = 500 wei;
                        produtores.transfer(multa);
        }      

    }
}

    function getAnos() view public returns (uint){
        return anos;
    }

    function getBalance() view public returns (uint){
        return produtores.balance;
    }
}
