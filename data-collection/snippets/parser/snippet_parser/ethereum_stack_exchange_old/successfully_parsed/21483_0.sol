pragma solidity ^0.4.0;
contract hcare

{
    struct block 
    {
            string fileHash;
            uint numRecv;
            address[] recvAddress;
    }

    uint i;
    uint recvCount;
    
    address owner;
    block temp;
     
    block[] Blocks; 

    event fileUploaded (address sender , uint cnt);

    function hcare()
    {
            owner = msg.sender;

    }

    function addBlock (string fHash, address[] recvAddr) public
    {


            

            Blocks.push(block(fHash , recvAddr.length , recvAddr));
            fileUploaded (msg.sender, Blocks.length);
    }

    function getBlockCount() public constant returns (uint)
    {
        return Blocks.length;
    }



    function getFileHash () public constant returns(string)
    {
            string tempFHash;  
            uint ctr=0;
            uint i;
            uint j;

            for (i=0; i < Blocks.length;i++)
            {
                    for ( j=0; j<Blocks[i].recvAddress.length;j++)
                    {
                            if (Blocks[i].recvAddress[j] == msg.sender)
                            {
                                    tempFHash = Blocks[i].fileHash;
                                    ctr = 1;

        

                             }
                    }
            }        
            if(ctr == 1)
            return tempFHash;
            else
            return "error";
        }
    }
