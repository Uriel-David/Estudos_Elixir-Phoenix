defmodule CoinFlip do
  def flip() do
    if :rand.uniform(2) > 1 do
      :heads
    else
      :tails
    end
  end
end
