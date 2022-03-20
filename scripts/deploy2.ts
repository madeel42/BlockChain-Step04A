import { ethers } from "hardhat";
import { CallerDemo, CallerDemo__factory, CallFunctionDemo, CallFunctionDemo__factory, SecondContract, SecondContract__factory } from "../typechain";

async function main() {

  const CallerDemo: CallerDemo__factory = await ethers.getContractFactory("CallerDemo");
  const callerDemo: CallerDemo = await CallerDemo.deploy();

  await callerDemo.deployed();

  console.log("callerDemo deployed to:", callerDemo.address);





  // const txt = await callFunctionDemo.callerFunTest()
  // const txt = await callFunctionDemo.callerFunTestDelegate()
//   const txt = await callerDemo.testFunctionCall()
  const txt = await callerDemo.testNewFunctionCall()

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
