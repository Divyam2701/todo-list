// ecosystem.config.js
module.exports = {
    apps: [
      {
        name: "to-do-list",
        script: "npx",
        args: "serve dist -s -l 3000",
        exec_mode: "fork",
      },
    ],
  };
  