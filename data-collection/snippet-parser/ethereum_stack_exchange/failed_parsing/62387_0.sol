
struct Place {
  uint8 placeid;
  string nameOfPlace;
  ...etc
}





struct Banner {
  uint8 bannerid;
  uint8 placeAt; 
  string thingTheBannerSays;
  uint8 timestamp;
}

Place[] places;                        
mapping(uint8 => Place)  placesById    
Banner[] banners;
mapping(uint8 => Banner)  bannersById  





function listBannersAtPlacesRightNow() returns (???? arrayOfMappings) {
  ??? mappings[] = arrayOfMappings
  for(uint8 i =0; i < places.length; i++) {
     maxTime[i] = 0;       
     idWhereMaxTime[i] = 0; 
     for(uint8 j=0; j < banners.length; j++) {
        if(banners[j].timestamp > maxTime[i]) {
          maxTime[i] = banners[j].timestamp 
          idWhereMaxTime[i] = banners[j];
        }
       }
     arrayOfMappings[i] = (places[i], idWheremaxTime[i]);
   }
 return arrayOfMappings;
 }
