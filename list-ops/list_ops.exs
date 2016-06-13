defmodule ListOps do
  #Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([head|tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse([]), do: []
  #def reverse([head|tail]), do: :erlang.++(reverse(tail), [head]) #This works too but use ++ from Erlang
  def reverse(list), do: reverse_helper(list, [])
  defp reverse_helper([], acc), do: acc
  defp reverse_helper([head|tail], acc), do: reverse_helper((tail), [head|acc])
  defp reverse_helper(a, acc), do: reverse_helper([a], acc)

  @spec map(list, (any -> any)) :: list
  def map(l, f) when l == [], do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) when l == [], do: []
  def filter([head|tail], f) do
    if f.(head) == true do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce([head | tail], acc, f) do
    acc = f.(head, acc)
    reduce(tail, acc, f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []
  def append(a, []), do: a
  def append([], b), do: b
  def append(a,b) do
    append_helper(b, reverse(a))
  end
  defp append_helper([], a), do: reverse(a)
  defp append_helper([head|tail], a), do: append_helper(tail, [head|a])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat_helper(ll, [])
  defp concat_helper([], acc), do: acc
  defp concat_helper([head|tail], acc) do
    concat_helper(tail, append(acc, head))
  end
end
