# final DEMO
command for image build and container launch:
docker build --build-arg dbhost=$dbhost --build-arg dbuser=$dbuser --build-arg dbpass=$dbpass --build-arg dbname=$dbname -t my-image:v3 .; docker run -p 80:80 my-image:v3  