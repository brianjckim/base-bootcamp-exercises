// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FavoriteRecords {
    mapping(string => bool) public approvedRecords;
    string[] approvedRecordNames;

    mapping(address => mapping(string => bool)) userFavorites;
    mapping(address => string[]) userFavoriteRecords;

    constructor() {
        approvedRecordNames = ["Thriller", "Back in Black", "The Bodyguard", "The Dark Side of the Moon", "Their Greatest Hits (1971-1975)", "Hotel California", "Come On Over", "Rumours", "Saturday Night Fever"];
        for (uint i = 0; i < approvedRecordNames.length; i++) {
            approvedRecords[approvedRecordNames[i]] = true;
        }
    }

    function getApprovedRecords() public view returns (string[] memory) {
        return approvedRecordNames;
    }

    error NotApproved(string _albumName);
    function addRecord(string memory _albumName) public {
        if (approvedRecords[_albumName] == false) {
            revert NotApproved(_albumName);
        }

        userFavorites[msg.sender][_albumName] = true;
        userFavoriteRecords[msg.sender].push(_albumName);
    }

    function getUserFavorites(address _userAddress) public view returns (string[] memory) {
        return userFavoriteRecords[_userAddress];
    }

    function resetUserFavorites() public {
        for (uint i = 0; i < userFavoriteRecords[msg.sender].length; i++) {
            delete userFavorites[msg.sender][userFavoriteRecords[msg.sender][i]];
        }

        delete userFavoriteRecords[msg.sender];
    }
}