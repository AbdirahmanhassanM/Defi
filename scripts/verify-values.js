async function main() {
    const [deployer] = await ethers.getSigners();
    
    // Få kontraktinstansen
    const StudentToken = await ethers.getContractFactory("StudentToken");
    const token = await StudentToken.attach("DIN_KONTRAKT_ADRESSE"); // Erstatt med din faktiske kontrakt adresse
    
    // Sjekk ticker
    const symbol = await token.symbol();
    console.log("Token symbol:", symbol);
    console.log("Expected symbol: sug65sk");
    console.log("Symbol matches:", symbol === "sug65sk");
    
    // Sjekk total supply
    const totalSupply = await token.totalSupply();
    const expectedSupply = BigInt("123285110000000000000000000000000000000000000000000000000000000000");
    console.log("Total supply:", totalSupply.toString());
    console.log("Expected supply:", expectedSupply.toString());
    console.log("Supply matches:", totalSupply === expectedSupply);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    }); 