const fs = require("fs");

const INPUT_DIR  = "YourJsonFilesDirectory";
const OUTPUT_DIR = "YourArtifactsDirectory";

for (const fileName of fs.readdirSync(INPUT_DIR)) {
    const data = JSON.parse(fs.readFileSync(INPUT_DIR + fileName, {encoding: "utf8"}));
    fs.writeFileSync(OUTPUT_DIR + fileName.replace(".json", ".abi"), JSON.stringify(data.abi)  , {encoding: "utf8"});
    fs.writeFileSync(OUTPUT_DIR + fileName.replace(".json", ".bin"), data.bytecode.substring(2), {encoding: "utf8"});
}
