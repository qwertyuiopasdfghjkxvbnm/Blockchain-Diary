// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainDiary {

    // Mapping to store diary entries for each user by their address
    mapping(address => string[]) private diaryEntries;

    // Event to emit when a new diary entry is created
    event DiaryEntryAdded(address indexed user, uint256 entryId, string entry);

    // Function to add a new diary entry
    function addDiaryEntry(string memory entry) public {
        // Append the entry to the user's diary
        diaryEntries[msg.sender].push(entry);

        // Emit the event for the new entry
        uint256 entryId = diaryEntries[msg.sender].length - 1;
        emit DiaryEntryAdded(msg.sender, entryId, entry);
    }

    // Function to get the total number of diary entries for the caller
    function getDiaryEntryCount() public view returns (uint256) {
        return diaryEntries[msg.sender].length;
    }

    // Function to get a specific diary entry for the caller by its ID
    function getDiaryEntry(uint256 entryId) public view returns (string memory) {
        require(entryId < diaryEntries[msg.sender].length, "Invalid entry ID");
        return diaryEntries[msg.sender][entryId];
    }
}
