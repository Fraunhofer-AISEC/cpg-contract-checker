    uint cropPr = cropTypes[_cropType]; 
    
    cropCounter++;
    Crop memory crop ;
    crop.cropId=cropCounter;
    
    crop.cropType = _cropType;        
    crop.farmer_quantity=_quantity;
    crop.location=_location;
    crop.farmerAddrs = payable(msg.sender);
    crop.cropPrice = cropPr;
    crop.isAdded=true;
    crops[cropCounter] = crop;      
    
