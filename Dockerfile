# Use the official Python image with Git installed
FROM python:3.9-slim

# Install git
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clone the latest version of Ollama
RUN git clone https://github.com/ollama/ollama.git /ollama

# Change the working directory
WORKDIR /ollama

# Install Ollama requirements (assuming there's a requirements.txt)
# Or use the setup.py if available
RUN pip install -r requirements.txt
# Or if setup.py is used
# RUN pip install .

# Command to run on container startup
CMD ["ollama", "run", "llama2"]
