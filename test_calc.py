import unittest

import calc


class TestCalc(unittest.TestCase):
    def test_fact(self):
        self.assertEqual(calc.fact(0), 1)
        self.assertEqual(calc.fact(5), 120)
        self.assertEqual(calc.fact(10), 3628800)

    def test_fact_negative(self):
        with self.assertRaises(ValueError):
            calc.fact(-1)

    def test_fib(self):
        self.assertEqual(calc.fib(0), 0)
        self.assertEqual(calc.fib(1), 1)
        self.assertEqual(calc.fib(10), 55)


if __name__ == "__main__":
    unittest.main()
