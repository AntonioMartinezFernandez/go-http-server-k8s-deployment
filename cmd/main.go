package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/shirou/gopsutil/host"
)

func helloHandler(w http.ResponseWriter, req *http.Request) {
	log.Println("executing helloHandler")
	hostStat, _ := host.Info()
	fmt.Fprintf(w, "<h1>Hello from Go!</h1>\n\n"+"<h3>Host ID: "+hostStat.HostID+"</h3>\n")
}

func headersHandler(w http.ResponseWriter, req *http.Request) {
	log.Println("executing headersHandler")
	for name, headers := range req.Header {
		for _, h := range headers {
			fmt.Fprintf(w, "%v: %v\n", name, h)
		}
	}
}

func main() {
	http.HandleFunc("/", helloHandler)
	http.HandleFunc("/headers", headersHandler)

	log.Println("starting http server at port 8080")
	http.ListenAndServe(":8080", nil)
}
