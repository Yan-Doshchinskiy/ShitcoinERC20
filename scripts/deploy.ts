import { ethers } from "hardhat";

async function main(): Promise<void> {
  const Factory = await ethers.getContractFactory("ShitcoinToken");
  const Contract = await Factory.deploy("Hello, Hardhat!");
  await Contract.deployed();
  console.log("Greeter deployed to:", Contract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
