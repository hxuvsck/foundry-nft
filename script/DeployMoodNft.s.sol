// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() public returns (MoodNft) {
        // We could hard code our SVG files as shown in test of MoodNftTest.t.sol, but Patrick showed more option which added function below (svgToImageURI).
        // To read these SVG files into our Solidity, we can only do this in Foundry as can't actually read in scripts in SCs. To do it, we using the cheatcode named "readFile" in Foundry.
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
    }

    function svgToImageURI(
        string memory svg
    ) public view returns (string memory) {
        // What this function actually do is
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
        // Could use string.concat. Which one would be more gas efficient
    }
}
