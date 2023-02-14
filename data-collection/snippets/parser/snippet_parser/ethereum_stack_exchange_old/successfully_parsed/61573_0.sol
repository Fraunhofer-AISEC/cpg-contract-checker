                pragma solidity ^0.4.17;
                
                contract GiveRefreceId {

                     mapping(address => uint256) public referenceid;
                        address[] public clients;
                        uint256 idcounter;

                    struct  MlMMembership_Payment{
                        string CompanyName;
                        uint256 DistributorId;
                        uint256 RefrenceDistributorId;
                        uint256 Amount;
                    }


                    MlMMembership_Payment[] MlMember;

                        event createdId(address user, uint256 id);

                        function giveRefrenceId() public returns (uint256)  { 
                            require(referenceid[msg.sender]==0);
                            idcounter += 1;
                            clients.push(msg.sender);
                            referenceid[msg.sender] = idcounter;
                            emit createdId(msg.sender,idcounter);
                            
                            return idcounter;
                        }


    function MLMloyalityPoints(string _Compney_name,uint256 _refreeid) public payable {
        uint256 temprefreeid  =  _refreeid-1;
        var  tempaddress = clients[temprefreeid];
        
         tempaddress.transfer(1000000000000000);

        }

}
