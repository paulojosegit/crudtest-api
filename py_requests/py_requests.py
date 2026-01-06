import requests
import random
import time

# Endpoints
SUCCESS_ENDPOINT = "http://localhost:8080/customers"
ERROR_ENDPOINT = "http://localhost:8080/customer"

# Configurações
TOTAL_REQUESTS_PER_CYCLE = 100  # base para calcular a porcentagem
SUCCESS_PERCENTAGE = 80         # % de requisições de sucesso
DELAY_BETWEEN_REQUESTS = 0.1    # segundos

def generate_request_pool():
    success_requests = int(TOTAL_REQUESTS_PER_CYCLE * (SUCCESS_PERCENTAGE / 100))
    error_requests = TOTAL_REQUESTS_PER_CYCLE - success_requests

    pool = (
        [SUCCESS_ENDPOINT] * success_requests +
        [ERROR_ENDPOINT] * error_requests
    )

    random.shuffle(pool)
    return pool

def send_request(url):
    try:
        response = requests.get(url, timeout=5)
        print(f"[{response.status_code}] -> {url}")
    except Exception as e:
        print(f"[ERROR] -> {url} | {e}")

if __name__ == "__main__":
    print("Iniciando geração contínua de requisições...")
    print(f"Sucesso: {SUCCESS_PERCENTAGE}% | Erro: {100 - SUCCESS_PERCENTAGE}%")

    while True:
        request_pool = generate_request_pool()

        for endpoint in request_pool:
            send_request(endpoint)
            time.sleep(DELAY_BETWEEN_REQUESTS)
