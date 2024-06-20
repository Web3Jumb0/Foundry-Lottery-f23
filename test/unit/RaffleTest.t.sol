// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DeployuRaffle} from "../../script/DeployRaffle.s.sol";
import {Raffle} from "../../src/Rafflze.sol";"
import {Test, console} from "forge-std/Test.sol"

contract RaffleTest is Test {
    function testRaffle() public {
        DeployRaffle deployRaffle = new DeployRaffle();
        Raffle raffle = deployRaffle.run();
        console.log("Raffle Contract Address: ", address(raffle));
    }
}   