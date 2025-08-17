#!/usr/bin/env python3
import unittest
from app import add_numbers, multiply_numbers, divide_numbers, greet_user, calculate_factorial, is_prime

class TestMathOperations(unittest.TestCase):
    
    def test_add_numbers(self):
        """Test addition function"""
        self.assertEqual(add_numbers(2, 3), 5)
        self.assertEqual(add_numbers(-1, 1), 0)
        self.assertEqual(add_numbers(0, 0), 0)
        self.assertEqual(add_numbers(-5, -3), -8)
    
    def test_multiply_numbers(self):
        """Test multiplication function"""
        self.assertEqual(multiply_numbers(3, 4), 12)
        self.assertEqual(multiply_numbers(-2, 3), -6)
        self.assertEqual(multiply_numbers(0, 5), 0)
        self.assertEqual(multiply_numbers(-2, -3), 6)
    
    def test_divide_numbers(self):
        """Test division function"""
        self.assertEqual(divide_numbers(10, 2), 5)
        self.assertEqual(divide_numbers(9, 3), 3)
        self.assertEqual(divide_numbers(-6, 2), -3)
        self.assertAlmostEqual(divide_numbers(7, 3), 2.333333333333333)
        
        # Test division by zero
        with self.assertRaises(ValueError):
            divide_numbers(5, 0)
    
    def test_calculate_factorial(self):
        """Test factorial function"""
        self.assertEqual(calculate_factorial(0), 1)
        self.assertEqual(calculate_factorial(1), 1)
        self.assertEqual(calculate_factorial(5), 120)
        self.assertEqual(calculate_factorial(3), 6)
        
        # Test negative number
        with self.assertRaises(ValueError):
            calculate_factorial(-1)
    
    def test_is_prime(self):
        """Test prime number checking"""
        # Test prime numbers
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3))
        self.assertTrue(is_prime(5))
        self.assertTrue(is_prime(7))
        self.assertTrue(is_prime(11))
        
        # Test non-prime numbers
        self.assertFalse(is_prime(1))
        self.assertFalse(is_prime(4))
        self.assertFalse(is_prime(6))
        self.assertFalse(is_prime(8))
        self.assertFalse(is_prime(9))
        self.assertFalse(is_prime(10))
        
        # Test edge cases
        self.assertFalse(is_prime(0))
        self.assertFalse(is_prime(-5))

class TestUtilityFunctions(unittest.TestCase):
    
    def test_greet_user(self):
        """Test greeting function"""
        result = greet_user("Alice")
        self.assertIn("Alice", result)
        self.assertIn("Hello", result)
        self.assertIn("Welcome", result)
        
        # Test empty name
        result_empty = greet_user("")
        self.assertIn("Hello", result_empty)
        
        # Test special characters
        result_special = greet_user("John-Doe_123")
        self.assertIn("John-Doe_123", result_special)

class TestIntegration(unittest.TestCase):
    
    def test_complex_calculations(self):
        """Test combinations of functions"""
        # Test: (2 + 3) * 4 = 20
        step1 = add_numbers(2, 3)  # 5
        result = multiply_numbers(step1, 4)  # 20
        self.assertEqual(result, 20)
        
        # Test: 10 / 2 + 3 = 8
        step1 = divide_numbers(10, 2)  # 5
        result = add_numbers(step1, 3)  # 8
        self.assertEqual(result, 8)
    
    def test_edge_cases(self):
        """Test edge cases and boundary conditions"""
        # Test very large numbers
        large_result = add_numbers(999999, 1)
        self.assertEqual(large_result, 1000000)
        
        # Test decimal precision
        result = divide_numbers(1, 3)
        self.assertAlmostEqual(result, 0.3333333333333333, places=10)

if __name__ == "__main__":
    print("🧪 Running Unit Tests...")
    print("=" * 50)
    
    # Run tests with verbose output
    unittest.main(verbosity=2, exit=False)
    
    print("=" * 50)
    print("✅ Unit tests completed!")