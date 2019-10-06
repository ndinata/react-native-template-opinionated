#!/usr/bin/env node

const { execSync } = require('child_process');

// initialise git repo for the project for Husky to work
const projectPath = process.cwd();
execSync(`git init ${projectPath}`);
