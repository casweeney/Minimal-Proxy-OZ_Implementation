import { ethers } from "hardhat";

async function main() {
  const Store = await ethers.getContractFactory("Store");
  const store = await Store.deploy();
  await store.deployed();
  console.log(`Store contract deployed to ${store.address}`);

  const StoreFactory = await ethers.getContractFactory("StoreFactory");
  const storeFactory = await StoreFactory.deploy(store.address);

  const cloneTx = await storeFactory.clone();
  const cloneTxReceipt = await cloneTx.wait();

  console.log("Transaction Receipt: ", cloneTxReceipt.events);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
