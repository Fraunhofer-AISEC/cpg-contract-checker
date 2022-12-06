function addIDFileToPassport(address passport_id, bytes32 id_file) public returns (address, bytes32, uint) {
        Passport storage p = user_passports[passport_id]; 
        
        require(p.controller == msg.sender);
        p.identity_files_LUT.push(id_file);
        p.identity_files[id_file] = 1;
        return (p.controller, p.identity_files_LUT[p.identity_files_LUT.length - 1], p.identity_files[id_file]);
    }
