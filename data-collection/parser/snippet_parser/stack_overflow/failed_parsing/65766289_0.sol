    #![deny(warnings)]

    use borsh::{BorshDeserialize, BorshSerialize};
    use near_sdk::collections::{ TreeMap, UnorderedMap, UnorderedSet };
    use near_sdk::{env, near_bindgen, AccountId};

    #[global_allocator]
    static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

    pub trait NEP4 {
        
        
        
        fn grant_access(&mut self, escrow_account_id: AccountId);

        
        
        
        fn revoke_access(&mut self, escrow_account_id: AccountId);

        
        
        
        fn transfer_from(&mut self, owner_id: AccountId, new_owner_id: AccountId, token_id: TokenId); 

        
        
        
        
        fn transfer(&mut self, new_owner_id: AccountId, token_id: TokenId); 

        
        fn check_access(&self, account_id: AccountId) -> bool;

        
        fn get_token_owner(&self, token_id: TokenId) -> String;
    }
    
    pub type TokenId = u64;
    pub type AccountIdHash = Vec<u8>;

    
    #[near_bindgen]
    #[derive(BorshDeserialize, BorshSerialize)]
    pub struct NonFungibleTokenBasic {
        pub token_to_account: UnorderedMap<TokenId, AccountId>,
        pub account_gives_access: UnorderedMap<AccountIdHash, UnorderedSet<AccountIdHash>>, 
        pub owner_id: AccountId,
        pub sketch: TreeMap<TokenId, String> 
    }

    impl Default for NonFungibleTokenBasic {
        fn default() -> Self {
            panic!("NFT should be initialized before usage")
        }
    }

    #[near_bindgen]
    impl NonFungibleTokenBasic {
        #[init]
        pub fn new(owner_id: AccountId) -> Self {
            assert!(env::is_valid_account_id(owner_id.as_bytes()), "Owner's account ID is invalid.");
            assert!(!env::state_exists(), "Already initialized");
            Self {
                token_to_account: UnorderedMap::new(b"token-belongs-to".to_vec()),
                account_gives_access: UnorderedMap::new(b"gives-access".to_vec()),
                owner_id,
                sketch: TreeMap::new(b"sketch".to_vec()),
            }
        }
    }

    #[near_bindgen]
    impl NonFungibleTokenBasic {
        
        
        pub fn mint_token(&mut self, owner_id: String, token_id: TokenId, sketch: String) {
            
            self.only_owner();
            
            let token_check = self.token_to_account.get(&token_id);
            if token_check.is_some() {
                env::panic(b"Token ID already exists.")
            }
            
            self.token_to_account.insert(&token_id, &owner_id, &sketch);
        }

        
        fn only_owner(&mut self) {
            assert_eq!(env::predecessor_account_id(), self.owner_id, "Only contract owner can call this method.");
        }
    }


        fn transfer(&mut self, new_owner_id: AccountId, token_id: TokenId, sketch: String) {
            let token_owner_account_id = self.get_token_owner(token_id);
            let predecessor = env::predecessor_account_id();
            if predecessor != token_owner_account_id {
                env::panic(b"Attempt to call transfer on tokens belonging to another account.")
            }
            self.token_to_account.insert(&token_id, &new_owner_id, &sketch);
        }

