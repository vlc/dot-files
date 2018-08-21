#!/bin/bash

DB_SEARCH_DIRS="$HOME/Projects $HOME/src /opt $HOME/src/vlc $HOME/Projects/vlc $HOME/p $HOME/src/bdk"

# See https://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash

declare -Ag databases
get_db_list() {
    databases=(["move_zov"]="psql -U zov -h move.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 zov" \
                           ["move_20170606"]="psql -U sa -h move.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 move_20170606" \
                           ["move_oracle"]="psql -U sa -h move.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 move" \
                           ["ams-sa"]="psql -U awsroot -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 postgres" \
                           ["ams-prod"]="psql -U jetski_prod_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prod" \
                           ["ams-prep"]="psql -U jetski_prep_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prep" \
                           ["ams-uat"]="psql -U jetski_uat_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_uat" \
                           ["ams-cd"]="psql -U jetski_cd_user -h jetski.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_cd" \
                           ["ams-snapshot"]="psql -U jetski_prod_user -h jetski-snapshot-jul15.ctofhnqqey87.us-east-1.rds.amazonaws.com -p 5432 jetski_prod" \
                           ["gtfs"]="psql -U gtfs -h gtfs.c2kzxi2yumcx.us-east-1.rds.amazonaws.com -p 5432 realtime" \
                           ["lumar-tng"]="psql -U sa gtfs -h lumar-tng.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 postgres" \
                           ["lumar-2016"]="psql -U sa -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 postgres" \
                           ["lumar-2016-adl"]="psql -U sa -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 adl_base_2016" \
                           ["lumar-2016-per"]="psql -U sa -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 per_base_2016" \
                           ["lumar-2016-seq"]="psql -U sa -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 seq_17_032" \
                           ["lumar-2016-mel"]="psql -U sa -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 mel_base_2016" \
                           ["lumar-oracle-perth"]="psql -U sa gtfs -h lumar-2016.cxdbsusx40q0.ap-southeast-2.rds.amazonaws.com -p 5432 postgres" \
              )
    echo ${!databases[@]}
}

db() {
    # Call the function once to populate the global $databases
    get_db_list > /dev/null
    PATTERN=$1
    COMMAND=$2
    CONNECT_STR=${databases[$PATTERN]}
    if [[ -z "${CONNECT_STR}" ]]; then
        echo "Can't find database ${PATTERN}";
        # exit -1
    else
        if [[ "$COMMAND" == "connect" ]]; then
            # Actually execute the connection string to get a psql shell
            $CONNECT_STR
        else
            echo ${CONNECT_STR}
        fi
    fi
}

_check_db_dirs() {
    cache_complete /bin/bash .cache_dbdir "get_db_list"
}

complete -F _check_db_dirs -o default db
