# bashrc

My bash setup, any misc scripts I might need etc... minus the API keys.

## bash scripts

### `dbtfull` _(dbt-full.sh)_

- I work with DBT a lot, and the amount of itmes i've had to type in `dbt run -m +my_model && dbt test -m my_model` seems like pointless repetition, especially if I then forget to seed it so have to rerun...
- [ ] **TODO:** This currently only runs a single model. Need to refactor to run multiple models in a single command.
