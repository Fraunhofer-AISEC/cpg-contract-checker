function retrieve_stored_byte_arrays_as_string(string memory text_part_label) private view returns(string memory) {
    string memory joined_string = "";
    bytes[] memory selected_text_parts = text_parts[text_part_label];
    uint selected_text_part_length = text_parts[text_part_label].length;
    for (uint i = 0; i < selected_text_part_length; i++) {
        joined_string = string(abi.encodePacked(joined_string, selected_text_parts[i]));
    }
    return joined_string;
}
