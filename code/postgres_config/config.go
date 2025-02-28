package postgres_config

import "fmt"

type Config struct {
	Host     string
	Port     string
	User     string
	Password string
	DBName   string
}

type PostgresConfig interface {
	DSN() string
}

func NewConfig(host, port, user, password, dbname string) *Config {
	return &Config{
		Host:     host,
		Port:     port,
		User:     user,
		Password: password,
		DBName:   dbname,
	}
}

func (c *Config) DSN() string {
	return fmt.Sprintf("postgres://%s:%s@%s:%s/%s", c.User, c.Password, c.Host, c.Port, c.DBName)
}
