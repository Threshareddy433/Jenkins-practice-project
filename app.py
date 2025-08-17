#!/usr/bin/env python3

def add_numbers(a, b):
    """Add two numbers and return the result"""
    return a + b

def multiply_numbers(a, b):
    """Multiply two numbers and return the result"""
    return a * b

def divide_numbers(a, b):
    """Divide two numbers and return the result"""
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def greet_user(name):
    """Greet the user with their name"""
    return f"Hello, {name}! Welcome to our Jenkins CI/CD pipeline!"

def calculate_factorial(n):
    """Calculate factorial of a number"""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def is_prime(n):
    """Check if a number is prime"""
    if n < 2:
        return False
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False
    return True

def main():
    """Main function to run the application"""
    print("=" * 60)
    print("🐍 Python Application - Jenkins CI/CD Demo")
    print("=" * 60)
    
    # Test basic operations
    num1, num2 = 10, 5
    
    addition_result = add_numbers(num1, num2)
    multiplication_result = multiply_numbers(num1, num2)
    division_result = divide_numbers(num1, num2)
    
    print(f"📊 Mathematical Operations:")
    print(f"   Addition: {num1} + {num2} = {addition_result}")
    print(f"   Multiplication: {num1} × {num2} = {multiplication_result}")
    print(f"   Division: {num1} ÷ {num2} = {division_result}")
    
    # Test factorial
    factorial_num = 5
    factorial_result = calculate_factorial(factorial_num)
    print(f"   Factorial: {factorial_num}! = {factorial_result}")
    
    # Test prime checking
    test_numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    primes = [num for num in test_numbers if is_prime(num)]
    print(f"   Prime numbers in {test_numbers}: {primes}")
    
    # Greet user
    greeting = greet_user("Jenkins User")
    print(f"\n🎉 {greeting}")
    
    # Application info
    print(f"\n📋 Application Information:")
    print(f"   Version: 1.0.0")
    print(f"   Environment: Production")
    print(f"   Status: ✅ All systems operational")
    
    print(f"\n✅ Application executed successfully!")
    print("=" * 60)

if __name__ == "__main__":
    main()