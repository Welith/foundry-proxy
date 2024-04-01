// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {SmallProxy, ImplementationA, ImplementationB} from "../src/SmallProxy.sol";

contract DeploySmallProxy is Script {
    SmallProxy public smallProxy;

    function run() public returns (SmallProxy) {
        vm.startBroadcast();
        smallProxy = new SmallProxy();
        vm.stopBroadcast();

        return smallProxy;
    }
}

contract DeployImplementatioA is Script {
    ImplementationA public implA;

    function run() public returns (ImplementationA) {
        vm.startBroadcast();
        implA = new ImplementationA();
        vm.stopBroadcast();

        return implA;
    }
}

contract DeployImplementatioB is Script {
    ImplementationB public implB;

    function run() public returns (ImplementationB) {
        vm.startBroadcast();
        implB = new ImplementationB();
        vm.stopBroadcast();

        return implB;
    }
}
