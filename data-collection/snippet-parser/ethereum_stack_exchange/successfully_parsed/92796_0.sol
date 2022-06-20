function insertnewcar(string memory model, string memory plate_) public  {
    car[c].car_name = model;
      car[c].plate = plate;
      car[c].car_id += 1;
     c++;
}
