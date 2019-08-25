const shell = require('shelljs')

const commitsCount = process.env.COMMITS_COUNT
const githubRepo = process.env.GITHUB_REPO

const generateFiles = () => {

  console.log(`Script will commit ${commitsCount} times`);
  const date = new Date()

  shell.exec('git init')
  shell.touch('FILE.TXT')
  shell.exec('git add FILE.TXT')

  for (let i = 0; i < commitsCount; i++) {
    shell.exec(`echo '${date.getMilliseconds()}' >> FILE.TXT`)
    shell.exec(`git commit -m "Add ${date.getMilliseconds()}"`)
  }

  shell.exec(`git remote add origin ${githubRepo}`)
  shell.exec(`git push -u origin master`)
}

module.exports = generateFiles