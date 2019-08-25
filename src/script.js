require('dotenv').config()
const shell = require('shelljs')
const generateAndPush = require('./filesGenerator')

if (!shell.which('git')) {
  shell.echo('Script requires git installed to run')
  shell.exit(1)
}

shell.mkdir('-p', 'FILES')
shell.cd('./FILES')

const date = new Date();

generateAndPush()

console.log(`Created ${process.env.COMMITS_COUNT} commits.`);
