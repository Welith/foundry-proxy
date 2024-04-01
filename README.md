```
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "setImplementation(address)" "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast
```

cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "getDataToTransact(uint256)" "777" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast



cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "getDataToTransact(uint256)" 777 --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast

0x552410770000000000000000000000000000000000000000000000000000000000000309

cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 0x552410770000000000000000000000000000000000000000000000000000000000000309 --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast

cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "readStorage()(uint256)" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast