#!/bin/bash

if [ "$SNOPT_LOCATION" ] && [ "${PY:0:1}" = "3" ]; then
    cd pyoptsparse/pySNOPT;
    echo "Secure copying SNOPT over SSH";
    scp -r "$SNOPT_LOCATION" .;
    cd ../..;
fi

echo "FINISHED RUNNING PYOPT SCRIPT"