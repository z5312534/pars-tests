# pars-tests

## Installing
Clone the git repo anywhere. For maximum ease of use I'd recommend cloning it into the parent directory of your assignment directory.

### Recommended directory structure
```
-- some_random_dir
   |-- pars
   |-- pars-tests
```


## Running
Run the `run_tests.sh` script.

### If you followed the recommended directory structure
#### From your assignment directory
- `../pars-tests/run_tests.sh`
#### From the test directory
- `./run_tests.sh`

### If you didn't / can't follow the recommended directory structure
You can set the location of the `pars` executable through the `$pars` environment variable. For example, you can test the reference solution like this:
- `pars='6991 pars' ./run_tests.sh`

## Test Output
If a test fails it will create `.out` and `.expected` files that you can inspect in the same directory as the test that failed.

**Make sure to inspect the test manually to check whether the test itself is correct or not! I may have simply interpreted the assignment spec differently from you.**
