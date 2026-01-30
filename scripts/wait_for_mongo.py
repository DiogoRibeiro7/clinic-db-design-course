"""Wait for MongoDB to accept connections on a TCP port."""

import argparse
import socket
import sys
import time


def wait_for_port(host: str, port: int, timeout: int, interval: float) -> bool:
    deadline = time.time() + timeout
    while time.time() < deadline:
        try:
            with socket.create_connection((host, port), timeout=2):
                return True
        except OSError:
            time.sleep(interval)
    return False


def main() -> int:
    parser = argparse.ArgumentParser(description="Wait for MongoDB to be ready")
    parser.add_argument("--host", default="127.0.0.1", help="Mongo host")
    parser.add_argument("--port", type=int, default=27017, help="Mongo port")
    parser.add_argument("--timeout", type=int, default=60, help="Timeout in seconds")
    parser.add_argument("--interval", type=float, default=1.0, help="Polling interval in seconds")
    args = parser.parse_args()

    ok = wait_for_port(args.host, args.port, args.timeout, args.interval)
    if ok:
        print("Mongo is accepting connections.")
        return 0

    print("Timed out waiting for Mongo.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
