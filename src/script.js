require('dotenv').config()
const invariant = require('invariant')
const shell = require('shelljs')
const generateAndPush = require('./filesGenerator')

invariant(process.env.COMMITS_COUNT, 'Please set COMMITS_COUNT in .env file')
invariant(process.env.GITHUB_REPO, 'Please set GITHUB_REPO in .env file')

if (!shell.which('git')) {
  shell.echo('Script requires git installed to run')
  shell.exit(1)
}

shell.mkdir('-p', 'FILES')
shell.cd('./FILES')

const date = new Date();

generateAndPush()

console.log(`Created ${process.env.COMMITS_COUNT} commits.`);
