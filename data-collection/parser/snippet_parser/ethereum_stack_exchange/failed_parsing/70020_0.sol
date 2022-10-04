function loadConsingment(
        address pid, 
        uint transportertype,
        address cid
        ) public {
        require(
            UsersDetails[msg.sender].role == roles.transporter,
            "Only Transporter can call this function"
        );
        require(
            transportertype > 0,
            "Transporter Type must be define"
        );

        if(transportertype == 1) {  
            RawMatrials(pid).pickPackage(msg.sender);
        } else if(transportertype == 2) {   
            Madicine(pid).pickPac kage(msg.sender);
        } else if(transportertype == 3) {   
            MadicineW_D(cid).pickWD(pid,msg.sender);
        } else if(transportertype == 4) {   
            MadicineD_P(cid).pickDP(pid,msg.sender);
        }
    }
