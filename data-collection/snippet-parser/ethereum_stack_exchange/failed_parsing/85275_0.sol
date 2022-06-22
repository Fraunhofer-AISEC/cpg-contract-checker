pragma solidity >=0.4.22 <0.7.0;


contract MagicIdeas {

    struct IdeaCard {
        address owner;
        string title;
        string text;
        string img_url;
        string card_id;
    }

    ....

    function update_card_data(string memory _card_id,
                            string memory _new_title,
                            string memory _new_text,
                            string memory _new_img_url) public {
        IdeaCard storage updatedCard; 
        updatedCard = IdCardMap[_card_id];
        if(bytes(_new_title).length>0){
            updatedCard.title = _new_title;
        }
        if(bytes(_new_text).length>0){
            updatedCard.text = _new_text;
        }
        if(bytes(_new_img_url).length>0){
            updatedCard.img_url = _new_img_url;
        }
    }
