for i in `cat names.txt`; do while :; do if [ `qme | wc -l` -lt 120 ]; then qsub align.sh -v Sample=${i}; break; else sleep 1; fi; done; done
