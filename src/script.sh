mkdir -p FILES
cd ./FILES


fileCount=$1
for i in {0..$($fileCount)}
do
    echo HELLO > "FILE${i}.TXT"
done
