require 'benchmark'

def fib_recursive(n)
  if n < 2
    n
  else
    # Add the two previous Fibonacci numbers to get the requested one.
    fib_recursive(n-1) + fib_recursive(n-2)
  end
end

def fib_iterative(n)
  # Default Fibonacci
  f = [0, 1]

  # Start at three, since we preloaded Fibonacci's defaults.
  i = 2

  while i <= n do
    f << (f[i-1] + f[i-2])

    i += 1
  end

  # Return the requested index of the Fibonacci array.
  f[n]
end

n = 60000
Benchmark.bmbm do |x|
  x.report("Recursive") { n.times {fib_recursive(18)} }
end