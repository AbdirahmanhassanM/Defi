// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/MyToken.sol";

// forge script script/Deploy_MyToken.sol --broadcast -vvv --rpc-url https://eth-holesky.g.alchemy.com/v2/AwXNQB1sZceWq5qoYpeR7U0jsYYvoBHv --private-key 
//https://ethereum-holesky-rpc.publicnode.com
// forge script script/Deploy_MyToken.sol --broadcast -vvv --rpc-url https://ethereum-holesky-rpc.publicnode.com --private-key 

contract DeployTokenScript is Script{
    function run() external{
        vm.startBroadcast();

        MyToken token = new MyToken();

        console2.log("ADTOK address : ", address(token));

        vm.stopBroadcast();
    }
}