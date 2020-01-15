#!/bin/bash

# Fail fast if graph building fails
set -e

java -Duser.timezone=Europe/Bucharest -jar server.jar ./env.yml ./server.yml

