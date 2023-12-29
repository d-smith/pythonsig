import "forge-std/Script.sol";

import "../src/Sig.sol";

contract SigScript is Script {
    uint256 private deployerPrivateKey;

    function setUp() public {
        deployerPrivateKey = vm.envUint("DEPLOYER_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        new Sig();
        vm.stopBroadcast();
    }
}
