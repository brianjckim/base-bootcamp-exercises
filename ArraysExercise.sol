// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appendToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint entries;
        for (uint i = 0; i < timestamps.length && i < senders.length; i++) {
            if (timestamps[i] > 946702800) {
                entries++;
            }
        }

        uint[] memory filteredTimestamps = new uint[](entries);
        address[] memory filteredSenders = new address[](entries);
        uint counter = 0;
        for (uint i = 0; i < timestamps.length && i < senders.length; i++) {
            if (timestamps[i] > 946702800) {
                filteredTimestamps[counter] = timestamps[i];
                filteredSenders[counter] = senders[i];
                counter++;
            }
        }
        return (filteredTimestamps, filteredSenders);
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}