#!/bin/bash
bin/rake db:drop
bin/rake db:create
bin/rake db:migrate
bin/rake db:seed
