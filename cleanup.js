const fs = require('fs');
const path = require('path');

const projectPath = path.join(__dirname, '..', '..');

// delete unnecessary project and template files
const projectFilesToDelete = ['App.js'];
const templateFilesToDelete = [
  'cleanup.js',
  'LICENSE',
  'README.md',
  'setupConfig.js',
];

const deleteFile = (filePath) => {
  if (!fs.existsSync(filePath)) {
    return;
  }

  fs.unlinkSync(filePath);
};

const deleteProjectFile = (fileName) => {
  deleteFile(path.join(projectPath, fileName));
};

const deleteTemplateFile = (fileName) => {
  deleteFile(path.join(__dirname, fileName));
};

projectFilesToDelete.forEach(deleteProjectFile);
templateFilesToDelete.forEach(deleteTemplateFile);
