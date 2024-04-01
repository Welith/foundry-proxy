// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Proxy} from "@openzeppelin/contracts/proxy/Proxy.sol";

contract SmallProxy is Proxy {
    bytes32 private constant _IMPLEMENTATION_SLOT = 0x27c2254dfdf3c2b78107336bbfa55d1ca295ab111829f85e419bc482eb139c1f;

    function setImplementation(address newImplementation) public {
        assembly {
            sstore(_IMPLEMENTATION_SLOT, newImplementation)
        }
    }

    function _implementation() internal view override returns (address implementationAddress) {
        assembly {
            implementationAddress := sload(_IMPLEMENTATION_SLOT)
        }
    }

    function getDataToTransact(uint256 numberToUpdate) public pure returns (bytes memory) {
        return abi.encodeWithSignature("setValue(uint256)", numberToUpdate);
    }

    function readStorage() public view returns (uint256 valueAtStorageSlotZero) {
        assembly {
            valueAtStorageSlotZero := sload(0)
        }
    }
}

contract ImplementationA {
    uint256 public value;

    function setValue(uint256 _value) public {
        value = _value;
    }
}

contract ImplementationB {
    uint256 public value;

    function setValue(uint256 _value) public {
        value = _value + 2;
    }
}
