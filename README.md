## Download Model
wget https://huggingface.co/TheBloke/CodeLlama-13B-Instruct-GGUF/blob/main/codellama-13b-instruct.Q4_K_M.gguf

docker build -t codellama:v0.6.0 .

docker run -v /home/naresh_sharma3/deployment/models/:/app/data -p 7860:7860 codellama:v0.6.0