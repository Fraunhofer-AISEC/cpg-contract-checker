function setPersonal_info(address Address, string id,string Handle, string First_name, string Last_name, string Email, uint phone_number, string Gender) public {
    var personal_info = (Personal_infos[Address][id]);
    personal_info.Handle = Handle;
    personal_info.First_name  = First_name;
    personal_info.Last_name   = Last_name;
    personal_info.Email = Email;
    personal_info.phone_number = phone_number;
    personal_info.Gender = Gender;
    
  
    emit Datastored(Address, id, Handle, First_name, Last_name, Email, phone_number, Gender);
}
