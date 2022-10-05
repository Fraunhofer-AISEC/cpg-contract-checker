#[ink::contract]
mod btc_new {

    use ink_prelude::string::String;

    #[ink(storage)]
    pub struct BookEntry {
        book_id: String,
        book_name: String,
        author_name: String,
        is_released: bool,
        
    }
