# System Integration

## Prerequisites
- Ubuntu 20
- The system needs to provide a Python connection
- The system needs to support csv format for data loading

## Intergration steps

 - Create a folder with the name of your system under `/systems` and install your database inside.
 - Install the Python client library inside the virtual environment (TSMvenv).
 - Load the datasets:


#### Data Loading Example for MonetDB:
```bash
   dataset=d1
   current="$(pwd)"
   mclient -p54320 -d mydb --interactive --timer=performance -s "DROP TABLE IF EXISTS $dataset; \
        CREATE TABLE $dataset ( time TIMESTAMP NOT NULL, id_station STRING, s0 DOUBLE PRECISION , s1 DOUBLE PRECISION , s2 DOUBLE PRECISION , s3 DOUBLE PRECISION , s4 DOUBLE PRECISION , s5 DOUBLE PRECISION , s6 DOUBLE PRECISION , s7 DOUBLE PRECISION , s8 DOUBLE PRECISION , s9 DOUBLE PRECISION , s10 DOUBLE PRECISION , s11 DOUBLE PRECISION , s12 DOUBLE PRECISION , s13 DOUBLE PRECISION , s14 DOUBLE PRECISION , s15 DOUBLE PRECISION , s16 DOUBLE PRECISION , s17 DOUBLE PRECISION , s18 DOUBLE PRECISION , s19 DOUBLE PRECISION , s20 DOUBLE PRECISION , s21 DOUBLE PRECISION , s22 DOUBLE PRECISION , s23 DOUBLE PRECISION , s24 DOUBLE PRECISION , s25 DOUBLE PRECISION , s26 DOUBLE PRECISION , s27 DOUBLE PRECISION , s28 DOUBLE PRECISION , s29 DOUBLE PRECISION , s30 DOUBLE PRECISION , s31 DOUBLE PRECISION , s32 DOUBLE PRECISION , s33 DOUBLE PRECISION , s34 DOUBLE PRECISION , s35 DOUBLE PRECISION , s36 DOUBLE PRECISION , s37 DOUBLE PRECISION , s38 DOUBLE PRECISION , s39 DOUBLE PRECISION , s40 DOUBLE PRECISION , s41 DOUBLE PRECISION , s42 DOUBLE PRECISION , s43 DOUBLE PRECISION , s44 DOUBLE PRECISION , s45 DOUBLE PRECISION , s46 DOUBLE PRECISION , s47 DOUBLE PRECISION , s48 DOUBLE PRECISION , s49 DOUBLE PRECISION , s50 DOUBLE PRECISION , s51 DOUBLE PRECISION , s52 DOUBLE PRECISION , s53 DOUBLE PRECISION , s54 DOUBLE PRECISION , s55 DOUBLE PRECISION , s56 DOUBLE PRECISION , s57 DOUBLE PRECISION , s58 DOUBLE PRECISION , s59 DOUBLE PRECISION , s60 DOUBLE PRECISION , s61 DOUBLE PRECISION , s62 DOUBLE PRECISION , s63 DOUBLE PRECISION , s64 DOUBLE PRECISION , s65 DOUBLE PRECISION , s66 DOUBLE PRECISION , s67 DOUBLE PRECISION , s68 DOUBLE PRECISION , s69 DOUBLE PRECISION , s70 DOUBLE PRECISION , s71 DOUBLE PRECISION , s72 DOUBLE PRECISION , s73 DOUBLE PRECISION , s74 DOUBLE PRECISION , s75 DOUBLE PRECISION , s76 DOUBLE PRECISION , s77 DOUBLE PRECISION , s78 DOUBLE PRECISION , s79 DOUBLE PRECISION , s80 DOUBLE PRECISION , s81 DOUBLE PRECISION , s82 DOUBLE PRECISION , s83 DOUBLE PRECISION , s84 DOUBLE PRECISION , s85 DOUBLE PRECISION , s86 DOUBLE PRECISION , s87 DOUBLE PRECISION , s88 DOUBLE PRECISION , s89 DOUBLE PRECISION , s90 DOUBLE PRECISION , s91 DOUBLE PRECISION , s92 DOUBLE PRECISION , s93 DOUBLE PRECISION , s94 DOUBLE PRECISION , s95 DOUBLE PRECISION , s96 DOUBLE PRECISION , s97 DOUBLE PRECISION , s98 DOUBLE PRECISION , s99 DOUBLE PRECISION );
        COPY OFFSET 2 INTO $dataset FROM '$current/../../datasets/$dataset.csv' USING DELIMITERS ',','\n';
        select sum(columnsize)/1024/1024/1024 from storage where table='$dataset'; " 
 ```


- Create a file called `queries.sql`that implements the queries. Make sure to keep the variables \<sid\> ,\<stid\> and \<timestamp\> as placeholders (see example [here](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/monetdb/queries.sql)).
- Create a file called `launch.sh` to launch the database (see example [here](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/influx/launch.sh)).
- Create a python script called  `run_system.py`to run the queries. The script should adhere to this [template](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/run_system_template.py).
- Add the name of your system's folder to [config.py](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/config.py).

- To use the online workload add the additional files:
    - `__init__.py`: file to use your folder as a Python module using 
[MonetDB \_\_init\_\_.py ](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/monetdb/__init__.py) and replacing MonetDB with "your\_system\_name".
    - `start.py`: a file to launch your system:
   define a launch function as in [MonetDB](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/monetdb/start.py) and as in the launch section of the `run_systems` file.
    - `add_data.py`: a file to add and delete data as in [MonetDB add\_data.py](https://github.com/eXascaleInfolab/TSM-Bench/tree/main/systems/monetdb/add_data.py) replace the connection and query execution and delete the data above the input timestamp.



