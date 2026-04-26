FROM codercom/code-server:latest

WORKDIR /home/coder/project

# Password set karo
ENV PASSWORD=123456

# Port HF ka default
EXPOSE 7860

# Code-server start
CMD ["code-server", "--bind-addr", "0.0.0.0:7860", "--auth", "password"]
