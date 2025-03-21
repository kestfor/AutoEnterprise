package utils

import (
	"AutoEnterpise/go_code/postgres_config"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func GetConfig(envPath string) postgres_config.PostgresConfig {

	err := godotenv.Load(envPath)
	if err != nil {
		log.Fatal("Error loading .env file", err)
	}

	host := os.Getenv("POSTGRES_HOST")
	port := os.Getenv("POSTGRES_PORT")
	user := os.Getenv("POSTGRES_USER")
	password := os.Getenv("POSTGRES_PASSWORD")
	dbname := os.Getenv("POSTGRES_DB")
	return postgres_config.NewConfig(host, port, user, password, dbname)
}
