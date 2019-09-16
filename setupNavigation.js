const fs = require('fs');
const path = require('path');

const projectPath = path.join(__dirname, '..', '..');
const projectFile = require(path.join(projectPath, 'app.json'));
const projectName = projectFile.name;

// copy MainActivity.java to complete React Navigation configuration
const mainActivitySrc = path.join(__dirname, 'MainActivity.java');
const mainActivityDest = path.join(
  projectPath,
  `android/app/src/main/java/com/${projectName}/MainActivity.java`,
);

const mainActivityContent = fs.readFileSync(mainActivitySrc, 'utf8');
const mainActivityProperContent = mainActivityContent.replace(
  'HelloWorld',
  projectName,
);
fs.writeFileSync(mainActivitySrc, mainActivityProperContent);

if (fs.existsSync(path.join(projectPath, 'android/'))) {
  fs.copyFileSync(mainActivitySrc, mainActivityDest);
}
