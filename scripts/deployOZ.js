const { ethers } = require("hardhat");

async function main() {
  const SuperMarioWorldOZ = await ethers.getContractFactory(
    "SuperMarioWorldOZ"
  );
  const superMarioWorld = await SuperMarioWorldOZ.deploy(
    "SuperMarioWorldOZ",
    "SPRMO"
  );

  await superMarioWorld.deployed();
  console.log("Success! Contract was deployed to: ", superMarioWorld.address);

  await superMarioWorld.mint(
    "https://ipfs.io/ipfs/QmYN7VtVdYfQdfXu6iJeUk1NBMAk5W52NGL8aAWSj83vY1"
  );

  console.log("NFT successfully minted");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
