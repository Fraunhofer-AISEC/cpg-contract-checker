
pragma solidity >=0.4.22 <0.9.0;

contract GeoSpatialData{

    uint public SpatialDataCount = 0;
    
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

    GeoData[] public geoDatas;

    mapping (uint => GeoData) public geodatas;
    
    function createData(string memory _data_name,address _owner_address,string memory _data_year,string memory  _data_description,string memory _data_image_url,string memory _data_url,string memory _data_published_date,string memory _data_category,uint _id ) public{
        SpatialDataCount++;
        uint used_id = SpatialDataCount+_id;
        geoDatas.push(GeoData({id: used_id,owner_address:_owner_address,data_name:_data_name,data_year:_data_year,data_description:_data_description,data_img_url:_data_image_url,data_url:_data_url,data_category:_data_category,data_published_date:_data_published_date}));
        
    }
    
    
    
    
    

    
    

    

}
