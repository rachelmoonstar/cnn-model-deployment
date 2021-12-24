#!/bin/bash

# install packages
apt-get update \
    && apt-get install -y \
        git

# run server
uvicorn main:app --host 0.0.0.0 --port 8000