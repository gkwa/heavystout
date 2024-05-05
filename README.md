# heavystout
Practice using [guilhem/bump](https://github.com/guilhem/bump?tab=readme-ov-file#bump) to bump my golang app versions.


Usage:

```bash
# setup
brew install shfmt
pip install git+https://github.com/taylormonacelli/heavystout
heavystout

# fails with error="can't open git: repository does not exist"
./t005.sh

# happy path
./t010.sh

# fails from error="is dirty"
./t020.sh

# fails from error="no tags"
./t030.sh
```
