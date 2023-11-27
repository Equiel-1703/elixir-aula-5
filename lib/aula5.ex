defmodule Aula5 do
  def ins(num, []), do: [num]
  def ins(num, [h | t]) do
    if num > h do
      [h | ins(num, t)]
    else
      [num | [h | t]]
    end
  end

  def ins_no_rep(num, []), do: [num]
  def ins_no_rep(num, [h | t]) do
    cond do
      num > h -> [h | ins_no_rep(num, t)]
      num < h -> [num | [h | t]]
      true -> [h | t]
    end
  end

  def ins_dec(num, []), do: [num]
  def ins_dec(num, [h | t]) do
    cond do
      num < h -> [h | ins_dec(num, t)]
      num >= h -> [num | [h | t]]
    end
  end

  def insertion_sort([]), do: []

  def insertion_sort([h | t]) do
    ins_dec(h, insertion_sort(t))
  end

  def menor(list) do
    if is_list(list) do
      hd(insertion_sort(list))
    else
      raise("Essa função recebe uma lista!")
    end
  end

  defp get_last([h | []]), do: h

  defp get_last([_ | t]) do
    get_last(t)
  end

  def maior(list) do
    if is_list(list) do
      get_last(insertion_sort(list))
    else
      raise("Essa função recebe uma lista!")
    end
  end
end
