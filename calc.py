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


OPERATIONS = {
    "fact": fact,
}


def main(argv):
    if len(argv) != 3 or argv[1] not in OPERATIONS:
        print("Использование: python3 calc.py <операция> <N>")
        print("Операции:", ", ".join(OPERATIONS))
        return 1
    print(OPERATIONS[argv[1]](int(argv[2])))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
