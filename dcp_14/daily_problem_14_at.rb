def calculate_pi
  circle_points = 0.0
  square_points = 0.0
  num = 1
  pi = 0
  while num < 5
    rand_x = rand
    rand_y = rand

    origin_dist = (rand_x * rand_x) + (rand_y * rand_y)

    if origin_dist <= 1
      circle_points += 1
    end
    square_points += 1
    num += 1
    pi = 4 * (circle_points / square_points)
  end
  puts pi
end
calculate_pi

def pi
  num = 4.0
  pi = 0
  plus = true

  den = 1
  while den < 100
    if plus
      pi = pi + num/den
      plus = false
    else
      pi = pi - num/den
      plus = true
    end
    den = den + 2
  end
end
