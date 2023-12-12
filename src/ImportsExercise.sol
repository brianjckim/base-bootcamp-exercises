// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library SillyStringUtils {
    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}

contract ImportsExercise {
    SillyStringUtils.Haiku public haiku;

    function saveHaiku(string memory _one, string memory _two, string memory _three) public {
        haiku = SillyStringUtils.Haiku(_one, _two, _three);
    }

    function getHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return haiku;
    }

    function shruggieHaiku() public view returns (SillyStringUtils.Haiku memory) {
        return SillyStringUtils.Haiku(
            haiku.line1,
            haiku.line2,
            SillyStringUtils.shruggie(haiku.line3)
        );
    }
}