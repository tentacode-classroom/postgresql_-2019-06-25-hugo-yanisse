#!/bin/bash

sudo -u postgres psql -f configure_db.sql

sudo systemctl restart postgresql