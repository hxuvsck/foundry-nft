// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    // Lesson: For testing string as it is an array of bytes, it can't be tested by asserting hence
    // it is not a primitive type of variable such as bool,address,uint and bytes. To assert them,
    // we need to make expected and actual strings matching by hashing them in Solidity.
    function testNameIsCorrect() public view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();
        // string is an array of bytes.
        // for(loop through the array) compate the elements
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }
}
