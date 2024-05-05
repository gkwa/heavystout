# heavystout
Practice using [guilhem/bump](https://github.com/guilhem/bump?tab=readme-ov-file#bump) to bump my golang app versions.

tl;dr:

remember to:
- put files in git repo
- commit files and leave no dirty files laying around
- git tag current HEAD

Usage:

```bash
# setup
brew install shfmt guilhem/homebrew-tap/bump

# create test scenarios
pip install git+https://github.com/taylormonacelli/heavystout
heavystout

# succeeds, happy path
./t010.sh

# fails with error="can't open git: repository does not exist"
./t005.sh

# fails from error="is dirty"
./t020.sh

# fails from error="no tags"
./t030.sh
```
