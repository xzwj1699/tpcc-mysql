DBNAME=$1
WH=$2
HOST=database-1-test-cy-instance-1.cezvim4cz4mz.ap-southeast-1.rds.amazonaws.com
STEP=50

./tpcc_load -h $HOST -d $DBNAME -u admin -P 3306 -p "passwderix" -w $WH -l 1 -m 1 -n $WH >> 1.out &

x=1

while [ $x -le $WH ]
do
 echo $x $(( $x + $STEP - 1 ))
./tpcc_load -h $HOST -d $DBNAME -u admin -P 3306 -p "passwderix" -w $WH -l 2 -m $x -n $(( $x + $STEP - 1 ))  >> 2_$x.out &
./tpcc_load -h $HOST -d $DBNAME -u admin -P 3306 -p "passwderix" -w $WH -l 3 -m $x -n $(( $x + $STEP - 1 ))  >> 3_$x.out &
./tpcc_load -h $HOST -d $DBNAME -u admin -P 3306 -p "passwderix" -w $WH -l 4 -m $x -n $(( $x + $STEP - 1 ))  >> 4_$x.out &
 x=$(( $x + $STEP ))
done