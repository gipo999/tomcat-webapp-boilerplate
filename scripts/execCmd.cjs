const { execSync } = require("child_process");

module.exports = {
  execCmd: (cmd) => {
    console.log(`Running: ${cmd}`);
    execSync(cmd, { stdio: "inherit" });
  },
};
