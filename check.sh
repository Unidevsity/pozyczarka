#!/bin/bash

brakeman
rails_best_practices .
rubocop -A
