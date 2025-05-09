FROM python:3.11-slim

WORKDIR /app

# 安装Git和必要工具
RUN apt-get update && apt-get install -y git

# 从GitHub克隆代码
RUN git clone https://github.com/adhikasp/mcp-reddit.git .

# 安装依赖
RUN pip install --no-cache-dir -e .

# 暴露8000端口（MCP服务器默认端口）
EXPOSE 8000

# 启动MCP服务器，使用sse传输方式以便远程访问
CMD ["python", "-m", "mcp_reddit.reddit_fetcher", "--transport", "sse", "--host", "0.0.0.0", "--port", "8000"]
