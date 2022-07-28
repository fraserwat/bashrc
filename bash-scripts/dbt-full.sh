#!/usr/bin/env bash

# To save me having to keep running dbt run and dbt test commands for the same tables
# also might as well throw seed in there for good measure as I often forget to seed

alias dbtfull="dbt_full_run"

function dbt_full_run() {
	if [[ $# -eq 0 ]]
	then
		echo "Please enter dbt model to run"
	else
		MODEL="+$1"
        # Checking for -excl flag: this stops it running upstream models. 
        # Models downstream from input
        for var in "$@"
        do
        	if [[ "$var" == "-excl" ]]
        	then
			EXCL=true
		else
			EXCL=false
            	fi
        done
		# Don't bother seeding if i've already got everything upstream pre-built
		if [[ $EXCL != true ]]
	        then
            		MODEL="${MODEL//+/}"
			dbt seed -m $MODEL
	        fi
			dbt run -m $MODEL && \
			dbt test -m $MODEL
	fi
}
