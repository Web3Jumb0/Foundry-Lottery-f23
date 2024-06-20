//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "src/Raffle.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle) {
        HelperConfig helperConfig = HelperConfig();
        (
            uint256 entranceFee,
            uint256 interval,
            uint256 vrfCoordinator,
            bytes32 gasLane,
            uint64 subscriptionId,
            uint32 callbackGasLimit
        ) = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
            Raffle raffle = new Raffle(
                entranceFee,
                interval,
                vrfCoordinator,
                gasLane,
                subscriptionId,
                callbackGasLimit
            );
        vm.stopBroadcast();
        return raffle;

    }
}