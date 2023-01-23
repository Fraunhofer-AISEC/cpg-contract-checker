contract Site_contract{

    struct details{

        bytes32[] name;
        bytes32[] location;
        uint256 number;
    }


    site_details private this_site;   

    function Site_contract(struct this_site_){

        this_site = this_site_;

    }
}
