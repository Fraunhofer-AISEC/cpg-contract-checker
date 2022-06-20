pragma solidity ^0.8.0;

        function generateId(uint myclassid) public
        {
            (found_,id_)=getAvailableId(myclassid);
             importantMapping[_id]=important_value;                
        }

        function getAvailableId(uint256 _tokenClassId) internal  returns (bool found,uint256 ext_id) 
        {
            
            
            
            ext_id=0;
            uint256[] storage availables=tokenClass[_tokenClassId].available_list;
            found=false;
            for (uint i ; i < availables.length;) 
            {
                uint256 val=tokenClass[_tokenClassId].available_list[i];
                if (val!=0)
                {
                    tokenClass[_tokenClassId].available_list[i]=0;
                    ext_id=val;
                    found=true;
                    break;
                }
                unchecked { ++i ;}

            }
            return (found,ext_id);

        }