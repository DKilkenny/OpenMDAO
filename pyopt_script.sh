#!/bin/bash

cd pyoptsparse/pySNOPT;
echo "Secure copying SNOPT over SSH";
scp -r "$SNOPT_LOCATION" .;
cd ../..;

