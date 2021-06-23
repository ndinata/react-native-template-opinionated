#!/usr/bin/env node

const { execSync, spawnSync } = require("child_process");

// initialise empty git repo for Husky to work
const projectPath = process.cwd();
execSync(`git init "${projectPath}"`);

// set custom git hooks path for Husky 6
spawnSync("git", ["config", "core.hooksPath", ".husky"]);
