defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: ({ :ok, atom } | { :error, String.t() })
  def classify(number) do
    quantification = quantify_number(number)
    cond do
      quantification == -1 -> {:error, "Classification is only possible for natural numbers."}
      quantification < number -> {:ok, :deficient}
      quantification == number -> {:ok, :perfect}
      quantification > number -> {:ok, :abundant}
      true -> {:error, "Unexpected failure."}
    end
  end

  defp quantify_number(number) do
    cond do
      number == 1 -> 0
      Enum.member?([1, 2, 3], number) -> 1
      number == 4 -> 3
      number > 4 -> 2..round(:math.sqrt(number))
        |> Enum.filter(fn(i) -> rem(number, i) == 0 end)
        |> Enum.map(fn(i) -> {i, div(number, i)} end)
        |> Enum.reduce(1, fn({i, j}, acc) -> acc + partner_sum(i, j) end)
      true -> -1
    end
  end

  defp partner_sum(i, i), do: i
  defp partner_sum(i, j), do: i + j

end
