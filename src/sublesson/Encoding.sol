// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Sublesson for Opcodes of EVM
 * @author Khuslen Ganbat (lead by Patrick Collings)
 * @notice I think this might not need to be in this NFT file section as to check it out on Remix IDE, whereas it might use gas for this sample NFT course lesson.
 */

contract Encoding {
    // function encodeAbi() public returns (string memory) {}
    function combineStrings() public pure returns (string memory) {
        // In Solidity, there is whole bunch of cheatsheets. And one of it is "abi.encodePacked()". When deployed this function and pushing the button on Remix IDE, it shows the string where we implied and VM was Javascript which is encoding those two in bytes form. And we are type casting it using string() in front of it.
        return string(abi.encodePacked("Hi, Mom!", "Miss you!"));
    }
}
