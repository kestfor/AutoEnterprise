package tests

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"fmt"
	"google.golang.org/grpc"
	"sync"
	"testing"
	"time"
)

func makeRequest(client pb.PersonServiceClient, userID int) {
	_, err := client.GetFilteredPersons(context.Background(), &pb.PersonFilter{Ids: []int32{int32(userID)}})
	if err != nil {
		fmt.Println("Request error:", err)
	}
}

func Test(t *testing.T) {
	numRequests := 10000
	numWorkers := 8
	requestsPerWorker := numRequests / numWorkers

	conn, err := grpc.Dial("localhost:12345", grpc.WithInsecure())
	if err != nil {
		fmt.Println("Failed to connect to server:", err)
		return
	}

	client := pb.NewPersonServiceClient(conn)

	var wg sync.WaitGroup
	startTime := time.Now()

	for i := 0; i < numWorkers; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := 0; j < requestsPerWorker; j++ {
				makeRequest(client, 1)
			}
		}()
	}

	wg.Wait()
	totalTime := time.Since(startTime).Seconds()
	fmt.Printf("Total time for %d requests: %.5f seconds\n", numRequests, totalTime)
	fmt.Printf("Overall RPS: %.5f\n", float64(numRequests)/totalTime)
}
