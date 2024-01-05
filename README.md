# enter the development shell

`nix develop`

# create virtualenv

`vin`

# install some python package

`pip install ...`

# deactivate the virtualenv

`vout`

# clean up the .venv directory

`vclean`

# build the python package

`python -m build`

# install a locally built package

`pip install ./dist/template_python-0.0.1-py3-none-any.whl`

# test it in the python repl

`python`

```
>>> from template_python import example
>>> example.add_one(3)
4
```

# run pytest

`pytest`
