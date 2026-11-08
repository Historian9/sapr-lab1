"""Простой консольный калькулятор (ЛР1, САПР)."""
import sys


def fact(n: int) -> int:
    """Факториал n (n >= 0)."""
    if n < 0:
        raise ValueError("n должно быть >= 0")
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result


def gcd(a: int, b: int) -> int:
    """Наибольший общий делитель (алгоритм Евклида)."""
    a, b = abs(a), abs(b)
    while b:
        a, b = b, a % b
    return a


OPERATIONS = {
    "fact": fact,
    "gcd": gcd,
}


def main(argv):
    if len(argv) < 3 or argv[1] not in OPERATIONS:
        print("Использование: python3 calc.py <операция> <аргументы...>")
        print("Операции:", ", ".join(OPERATIONS))
        return 1
    print(OPERATIONS[argv[1]](*map(int, argv[2:])))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
