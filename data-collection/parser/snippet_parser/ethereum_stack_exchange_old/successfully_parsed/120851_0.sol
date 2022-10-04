mapping(string => bytes[]) private text_parts;



function append_to_text_part(string memory key, string memory value) public {
    text_parts[key].push(bytes(value));
}
