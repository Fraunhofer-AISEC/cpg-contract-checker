function makeadmin(string memory cityN, address adminAdress, string memory AdminName, 
string memory hash) public
    {
        require(msg.sender==0x20db1A3eD27EEF75BEBb000961d07AD47Bf58197);

        require(!(ch[cityN].AAdminAdress==adminAdress ));
         require(!(adminscitystatus[cityN]));
        require(!(adminsaddressstatus[adminAdress]));

        ch[cityN].CCityName=cityN;
        ch[cityN].AAdminAdress=adminAdress;
        ch[cityN].AAdminName=AdminName;

        ch[cityN].hashh=hash;
          ch[cityN].noofadmins.push(adminAdress);
        ch[cityN].adminsid[adminAdress]=ch[cityN].noofadmins.length-1;
      adminscitystatus[cityN]=true;
        adminsaddressstatus[adminAdress]=true;
        cityforcompany.push(cityN);
        uint comid=cityforcompany.length-1;
        companycityid[cityN]=comid;
    }

