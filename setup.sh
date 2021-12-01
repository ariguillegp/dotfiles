#!/bin/bash

ansible-playbook --ask-become-pass -i hosts roles.yml
