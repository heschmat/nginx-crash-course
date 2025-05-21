# Variables
IMAGE_NAME = dr-house-app
CONTAINER_NAME = dr-house-container
PORT = 3000

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container
run:
	docker run -d -p $(PORT):3000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Stop the running container
stop:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

# Rebuild and run
restart: stop build run

# Show logs
logs:
	docker logs -f $(CONTAINER_NAME)

# Clean up dangling images
clean:
	docker image prune -f

# Run the app locally without Docker
local:
	node server.js
