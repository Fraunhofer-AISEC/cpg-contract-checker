
pragma solidity >=0.4.22 <0.9.0;

contract GeoSpatialData{
    
    struct GeoData{
        uint id;
        address owner_address;
        string data_name;
        string data_year;
        string data_description;
        string data_img_url;
        string data_url;
        string data_category;
        string data_published_date;
    }
    GeoData[] public geoData;
    
    function createData(string memory _data_name,address _owner_address,string _data_year,string _data_description,string _data_image_url,string _data_url,string _data_published_date ) public{


       
    }

    

    
    function readData() public{

    }

    
    function readSingle() public{

    }

}
