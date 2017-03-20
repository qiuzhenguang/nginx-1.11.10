git clone https://github.com/qiuzhenguang/nginx-1.11.10.git

cd nginx-1.11.10

git checkout mp4_module

PWD=`pwd`

#configure
./configure --without-http_rewrite_module --with-http_mp4_module

make 


mkdir logs || echo "logs dir exist"
touch logs/error.log

objs/nginx  -c conf/nginx.conf  -p .
ps -ef | grep `cat logs/nginx.pid`

cp ../m0020v5koql.p203.1.mp4 ./html/ || echo "file not exist"

curl "http://127.0.0.1:8501/m0020v5koql.p203.1.mp4?start=5&end=20" -o /dev/null -s -v

objs/nginx  -c conf/nginx.conf -p . -s stop
ps -ef | grep `cat logs/nginx.pid`

