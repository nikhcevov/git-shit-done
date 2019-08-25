const shell = require('shelljs')

const commitsCount = process.env.COMMITS_COUNT
const githubRepo = process.env.GITHUB_REPO

const generateFiles = () => {

  console.log(`Script will commit ${commitsCount} times`);

  shell.exec('git init')
  shell.touch('FILE.TXT')
  shell.exec('git add .')

  for (let i = 0; i < commitsCount; i++) {
    const date = new Date()

    shell.exec(`echo '${date}' >> FILE.TXT`)
    shell.exec(`git add .`)
    shell.exec(`git commit -m "Add ${date.getMilliseconds()}"`)
  }

  shell.exec(`git remote add origin ${githubRepo}`)
  shell.exec(`git push --force origin master`)
}

module.exports = generateFiles