.PHONY : server client tidy prc clean


server:
	go build -o ./bin/server ./server
	./bin/server	

client:
	go build -o ./bin/client ./client
	./bin/client

tidy:
	go mod tidy

prc:
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.0 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0 && \
    export PATH=$PATH:$(go env GOPATH)/bin && \
    #
	


clean:
	rm -rf bin

	
# .PHONY : server client tidy prc clean

# BIN_DIR := ./bin
# SERVER_BIN := $(BIN_DIR)/server
# CLIENT_BIN := $(BIN_DIR)/client
# PROTO_DIR := ./proto
# PROTO_FILE := $(PROTO_DIR)/hello.proto
# GO_PROTOC_GO_VERSION := v1.28.0
# GO_PROTOC_GRPC_VERSION := v1.3.0

# server:
# 	go build -o $(SERVER_BIN) ./server
# 	$(SERVER_BIN)

# client:
# 	go build -o $(CLIENT_BIN) ./client
# 	$(CLIENT_BIN)

# tidy:
# 	go mod tidy

# prc:
# 	echo "creating a auto generated code"
# 	go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.0
# 	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0
# 	echo $PATH
# 	export PATH=$PATH:/bin
# 	protoc --proto_path=proto \
#     --go_out=. \
#     --go-grpc_out=. \
#     proto/Hello.proto
	

# clean:
# 	rm -rf $(BIN_DIR)