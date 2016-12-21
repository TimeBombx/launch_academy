# YOUR CODE HERE
def factorial(n)
  return 1 if n <= 1

  n * factorial(n - 1)
end