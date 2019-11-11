pragma solidity ^0.5.8;

contract ComplexMap {
    enum Rank {Board, Member}

    struct Identification {
        string name;
        address addr;
        string email;
        string major;
        uint8 year;
    }

    struct Member {
        Identification id;
        Rank rank;
        string position;
        string date_joined;
        string date_left;
        bool is_active;
        uint256 meetings_attended;
        uint256 tokens_awarded;
    }

    mapping (string => address) public name_to_addr_db;
    mapping (address => Member) membership_db;

    constructor () public {
        Identification memory jzlong_id = Identification("John Long", 0xa60e4B2e7b460dA30eb6018e68C07d0f0cf8471B,
        "jzlong@ucdavis.edu", "CSE", 2);
        Member memory jzlong_stats = Member(jzlong_id, Rank.Board, "Head Instructor", "011101", "01111", true, 25, 1000);
        membership_db[0xa60e4B2e7b460dA30eb6018e68C07d0f0cf8471B] = jzlong_stats;
    }

    function get_member_id(address _member_addr) public view returns (string memory, address, string memory, string memory, uint8) {
        Identification storage temp_id = membership_db[_member_addr].id;
        return (temp_id.name, temp_id.addr, temp_id.email, temp_id.major, temp_id.year);
    }
}